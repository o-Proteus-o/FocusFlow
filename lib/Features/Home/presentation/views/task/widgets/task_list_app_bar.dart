import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:focusflow/constant.dart';
import 'package:intl/intl.dart';

class TaskListAppBarr extends StatefulWidget {
  const TaskListAppBarr({
    super.key,
    required this.format,
    required this.formated,
  });

  final DateFormat format;
  final DateFormat formated;

  @override
  State<TaskListAppBarr> createState() => _TaskListAppBarrState();
}

class _TaskListAppBarrState extends State<TaskListAppBarr> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${DateTime.now().hour}:${DateTime.now().minute}",
                style: TextStyle(fontSize: 60),
              ),
              Column(
                children: [
                  Text(
                    widget.format.format(DateTime.now()),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    widget.formated.format(DateTime.now()),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: DatePicker(
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectedTextColor: AppColors.greyColor,
            selectionColor: AppColors.blackColor,
            onDateChange: (date) {
              setState(() {
                showDatePicker(
                  context: context,
                  firstDate: DateTime(2016),
                  lastDate: DateTime(20235),
                  initialDate: date,
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        primaryColor: AppColors.blackColor,
                        colorScheme: ColorScheme.light(
                          primary: AppColors.blackColor,
                        ),
                        buttonTheme: ButtonThemeData(
                          textTheme: ButtonTextTheme.primary,
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
              });
            },
          ),
        ),
      ],
    );
  }
}
