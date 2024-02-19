import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/feauture/setting/pages/setting_view.dart';
import 'package:untitled3/feauture/tasks/pages/task_view.dart';

class setting_provider extends ChangeNotifier {
  List<Widget> screens = [
    task_view(),
    setting_view(),
  ];
  int currentIndex = 0;
  ThemeMode currentTheme = ThemeMode.light;

  changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;

    notifyListeners();
  }

  changeIndex(int index) {
    currentIndex = index;

    notifyListeners();
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
    notifyListeners();
  }
}
