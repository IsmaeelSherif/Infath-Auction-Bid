
import 'package:infath_admin/constants/event_names.dart';
import 'package:window_manager_plus/window_manager_plus.dart';

const _clientWindowId = 1;

abstract class NetworkHelper {
  static Future<void> send(EventNames event, [dynamic data]) async {
    await WindowManagerPlus.current.invokeMethodToWindow(_clientWindowId, event.name, data);
  }
}