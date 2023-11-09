import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/router/route_manager.dart';
import 'core/theme/theme_data.dart';
import 'core/translate/local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isDarkMode = prefs.getBool('theme') ?? false;
  String languageCode = prefs.getString('language') ?? 'en-US';

  runApp(MainApp(isDarkMode: isDarkMode, languageCode: languageCode));
}

class MainApp extends StatelessWidget {
  const MainApp(
      {super.key, required this.isDarkMode, required this.languageCode});
  final bool isDarkMode;
  final String languageCode;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Localization(),
      debugShowCheckedModeBanner: false,
      title: 'Rutin',
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      initialRoute: RouteManagement.initialRoute,
      getPages: RouteManagement.routeList,
      locale: Locale(languageCode),
    );
  }
}
