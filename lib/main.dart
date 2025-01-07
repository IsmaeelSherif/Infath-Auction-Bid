import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_manager_plus/window_manager_plus.dart';

import 'ClientApp/client_app.dart';
import 'UI/page.dart';
import 'constants/constants.dart';
import 'provider/admin_provider.dart';

void main(List<String> args) async {
  print('hello $args');
  final bool isAdminInstance = args.isEmpty;


  WidgetsFlutterBinding.ensureInitialized();

  await WindowManagerPlus.ensureInitialized(isAdminInstance ? 0 : 1);

  // Now you can use the plugin, such as WindowManagerPlus.current
  WindowOptions windowOptions = WindowOptions(
    size: Size(1080, 720),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
    title: isAdminInstance ? "Admin" : "Safwat AlIhsan"
  );
  WindowManagerPlus.current.waitUntilReadyToShow(windowOptions, () async {
    await WindowManagerPlus.current.show();
    await WindowManagerPlus.current.focus();
  });

  if(isAdminInstance){
    final newWindow = await WindowManagerPlus.createWindow(['_']);
    if (newWindow != null) {
      print('New Created Window: $newWindow');
    }

    runApp(const AdminApp());
  }
  else {
    runApp(const ClientApp());
  }

}

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kBluePrimaryColor),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => AdminProvider(),
        child: AdminPage()
      )
    );
  }
}