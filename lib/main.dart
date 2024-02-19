import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/constant/application_theme_manager.dart';
import 'feauture/layout_view.dart';
import 'feauture/setting_provider.dart';
import 'feauture/splash/pages/splash_screen.dart';
import 'feauture/tasks/pages/task_view.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => setting_provider(), child: Myapp()));
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<setting_provider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "todo",
      theme: ApplicationThemeManager.lightTheme,
      darkTheme: ApplicationThemeManager.darkTheme,
      themeMode: vm.currentTheme,
      initialRoute: SplashView.routName,
      routes: {
        SplashView.routName: (context) => const SplashView(),
        task_view.routName: (context) => task_view(),
        layout_view.routName: (context) => const layout_view(),
      },
    );
  }
}
