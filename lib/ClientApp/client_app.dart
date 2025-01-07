
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Logic/client_provider.dart';
import 'UI/page.dart';


class ClientApp extends StatelessWidget {
  const ClientApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saftwat AlIhsan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => ClientProvider(context),
        child: ClientWindow()
      ),
    );
  }
}