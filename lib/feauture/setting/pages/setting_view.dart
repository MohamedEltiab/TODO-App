import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../setting_provider.dart';

class setting_view extends StatelessWidget {
  List<String> language = ["English", "عربي"];

  List<String> Mode = ["dark", "light"];
  static const String routName = "setting_view";

  setting_view({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var vm = Provider.of<setting_provider>(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: mediaQuery.width,
              height: mediaQuery.width * 0.2,
              color: theme.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 80),
              child: Text("Setting", style: theme.textTheme.titleLarge),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Language",
              style: theme.textTheme.bodySmall,
            ),
            SizedBox(height: 10),
            CustomDropdown(
                decoration: CustomDropdownDecoration(
                    closedBorder: Border.all(
                      color: theme.primaryColor,
                    ),
                    closedFillColor:
                        vm.isDark() ? Color(0xFF141922) : Colors.white,
                    closedSuffixIcon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: vm.isDark() ? Color(0xFF141922) : Colors.black,
                    )),
                items: language,
                onChanged: (value) {}),
            SizedBox(height: 40),
            Text("Mode",
                style: theme.textTheme.bodySmall?.copyWith(
                    color: vm.isDark() ? Colors.white : Color(0xFF141922))),
            SizedBox(height: 10),
            CustomDropdown(
                items: Mode,
                decoration: CustomDropdownDecoration(
                    closedBorder: Border.all(
                      color: theme.primaryColor,
                    ),
                    closedFillColor:
                        vm.isDark() ? Color(0xFF141922) : Colors.white,
                    closedSuffixIcon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: vm.isDark() ? Color(0xFF141922) : Colors.black,
                    )),
                onChanged: (value) {
                  if (value == "dark") {
                    vm.changeTheme(ThemeMode.dark);
                  } else if (value == "light") {
                    vm.changeTheme(ThemeMode.light);
                  }
                })
          ],
        ),
      ),
    );
  }
}
