import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_on/app_color.dart';
import 'package:todo_on/task_item.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: AppColor.grey,
            dayColor: AppColor.secondary,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: AppColor.secondary,
            dotColor: Colors.white,
            selectableDayPredicate: (date) => date.day != 23,
            locale: 'en',
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 24,
              ),
              itemBuilder: (context, index) {
                return TaskItem();
              },
              itemCount: 30,
            ),
          ),

      ],
    );
  }
}
