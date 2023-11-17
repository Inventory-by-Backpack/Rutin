import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/router/route_manager.dart';
import 'core/translate/local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Localization(),
      debugShowCheckedModeBanner: false,
      title: 'Rutin',
      themeMode: ThemeMode.light,
      initialRoute: RouteManagement.initialRoute,
      getPages: RouteManagement.routeList,
    );
  }
}
