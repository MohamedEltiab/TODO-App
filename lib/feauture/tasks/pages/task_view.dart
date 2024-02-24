import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/feauture/tasks/widget/task_item_view.dart';

import '../../setting_provider.dart';

class task_view extends StatefulWidget {
  static const String routeName = "task_view";

  task_view({super.key});

  @override
  State<task_view> createState() => _task_viewState();
}

class _task_viewState extends State<task_view> {
  DateTime focusTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<setting_provider>(context);
    return Column(
      children: [
        Stack(
          alignment: Alignment(0, 1.3),
          clipBehavior: Clip.none,
          children: [
            Container(
              width: mediaQuery.width,
              height: mediaQuery.width * 0.2,
              color: theme.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 80),
              child: Text("ToDo List", style: theme.textTheme.titleLarge),
            ),
            EasyInfiniteDateTimeLine(
              firstDate: DateTime(2023),
              focusDate: focusTime,
              lastDate: DateTime(2025),
              showTimelineHeader: false,
              timeLineProps: EasyTimeLineProps(separatorPadding: 20),
              dayProps: EasyDayProps(
                  inactiveDayStyle: DayStyle(
                      decoration: BoxDecoration(
                    color: vm.isDark() ? Color(0xFF141922) : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  )),
                  todayStyle: DayStyle(
                      decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10),
                  )),
                  activeDayStyle: DayStyle(
                      dayNumStyle: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.primaryColor,
                      ),
                      dayStrStyle: theme.textTheme.bodySmall?.copyWith(
                        color: theme.primaryColor,
                      ),
                      monthStrStyle: theme.textTheme.bodySmall?.copyWith(
                        color: theme.primaryColor,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black38))),
                  height: 100),
              onDateChange: (selectedDate) {
                focusTime = selectedDate;
                setState(() {});
              },
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Expanded(
          child: ListView(
            children: [
              task_item_view(),
              task_item_view(),
              task_item_view(),
              task_item_view(),
              task_item_view(),
              task_item_view(),
              task_item_view(),
              task_item_view(),
            ],
          ),
        )
      ],
    );
  }
}
