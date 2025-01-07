
///This is used because casting using "as Map<String,dynamic>" doesn't work.
///firebase database returns the values as _InternalLinkedHashMap<Object?, Object?>
///Used to convert Firebase snapshots to easy used json maps

Map<String,dynamic>? toMap(value){
  if(value == null){
    return null;
  }
  return Map<String,dynamic>.from(value);
}

FirebaseSnapshot? fbMap(value){
  if(value == null){
    return null;
  }
  if(value is FirebaseSnapshot){
    return value;
  }
  return FirebaseSnapshot._(value);
}


class FirebaseSnapshot {

  final Map<String,dynamic> _map;

  FirebaseSnapshot._(value) : _map = Map<String,dynamic>.from(value);

  operator [](String key) {
    final value = _map[key];
    switch(value.runtimeType){
      case int:
      case String:
      case bool:
      case double:
      case List:
        return value;
      default:
        return fbMap(value);
    }
  }

  bool hasChild(String? key) {
    return _map.containsKey(key);
  }

  Map<String,dynamic> asJsonMap() => _map;

  Map<String,T> toMap<T>() => Map<String,T>.from(_map);

  Iterable<MapEntry<String, dynamic>> get entries => _map.entries;

  void forEach(void Function(String key, dynamic value) action) {
    final thisSnap = this;
    for(String k in _map.keys){
      action(k,thisSnap[k]);
    }
  }

  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(dynamic key, dynamic value) convert) {
    return _map.map(convert);
  }

  bool get isEmpty => _map.isEmpty;

  bool get isNotEmpty => _map.isNotEmpty;

  Iterable<String> get keys => _map.keys;

  List get values {
    final list = [];
    final thisSnap = this;
    for(String k in _map.keys){
      list.add(thisSnap[k]);
    }
    return list;
  }

  int get length => _map.length;

  void removeWhere(bool Function(String key, dynamic value) test) {
    _map.removeWhere(test);
  }

}
