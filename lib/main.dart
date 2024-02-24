import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/feauture/register/pages/register_view.dart';
import 'package:untitled3/firebase_options.dart';

import 'core/config/constant/application_theme_manager.dart';
import 'feauture/layout_view.dart';
import 'feauture/login/page/login_view.dart';
import 'feauture/setting_provider.dart';
import 'feauture/splash/pages/splash_screen.dart';
import 'feauture/tasks/pages/task_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        task_view.routeName: (context) => task_view(),
        layout_view.routeName: (context) => const layout_view(),
        register_view.routeName: (context) => register_view(),
        login_view.routeName: (context) => login_view()
      },
    );
  }
}
