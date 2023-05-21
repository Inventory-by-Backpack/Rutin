import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding/auth_bindings.dart';
import 'firebase_options.dart';
import 'router/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      title: 'Inventory',
      initialRoute: RouteManagement.initialRoute,
      getPages: RouteManagement.routeList,
      initialBinding: AuthBindings(),
    );
  }
}
