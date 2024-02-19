import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../setting_provider.dart';

class task_item_view extends StatelessWidget {
  const task_item_view({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<setting_provider>(context);
    return Container(
      clipBehavior: Clip.none,
      height: 115,
      width: mediaQuery.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: vm.isDark() ? Color(0xFF141922) : Colors.white,
          borderRadius: BorderRadius.circular(15.5)),
      child: Row(
        children: [
          Container(
            height: 90,
            width: 6,
            decoration: BoxDecoration(color: theme.primaryColor),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Play basket ball",
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: theme.primaryColor)),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Icon(Icons.alarm,
                      size: 20,
                      color: vm.isDark() ? Colors.white : Color(0xFF141922)),
                  SizedBox(
                    width: 5,
                  ),
                  Text(" 10.39AM",
                      style: theme.textTheme.bodySmall
                          ?.copyWith(fontWeight: FontWeight.w500))
                ],
              )
            ],
          ),
          Spacer(),
          Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.check_box_rounded))
        ],
      ),
    );
  }
}
