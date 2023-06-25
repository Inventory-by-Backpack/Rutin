import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'binding/auth_bindings.dart';
import 'router/route_manager.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      title: 'Inventory',
      initialRoute: RouteManagement.initialRoute,
      getPages: RouteManagement.routeList,
      initialBinding: AuthBindings(),
    );
  }
}
