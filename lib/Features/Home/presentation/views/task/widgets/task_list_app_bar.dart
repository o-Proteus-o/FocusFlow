// import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusflow/Features/Home/presentation/manager/date_time_cubit/date_time_cubit.dart';
import 'package:focusflow/constant.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

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
          child: BlocBuilder<DateTimeCubit, DateTimeState>(
            builder: (context, state) {
              return DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectedTextColor: AppColors.greyColor,
                selectionColor: AppColors.blackColor,
                onDateChange: (date) {
                  setState(() async {
                    final DateTime? picked = await showOmniDateTimePicker(
                      type: OmniDateTimePickerType.dateAndTime,
                      context: context,
                      firstDate: DateTime(2019),
                      lastDate: DateTime(2100),
                      initialDate: date,
                    );
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class SubjectBloc {}
