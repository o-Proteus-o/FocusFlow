import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focusflow/Features/Home/presentation/views/task/widgets/afb_add_item.dart';
import 'package:focusflow/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class FloatingBar extends StatefulWidget {
  const FloatingBar({super.key, required this.isClicked});
  final bool isClicked;

  @override
  State<FloatingBar> createState() => _FloatingBarState();
}

class _FloatingBarState extends State<FloatingBar> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.greyColor,
      foregroundColor: AppColors.blackColor,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(width: 1.5, color: AppColors.blackColor),
      ),
      onPressed: () {
        showCupertinoDialog(
          barrierDismissible: true,
          useRootNavigator: true,
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text("Choose"),
              content: Container(
                decoration: BoxDecoration(),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return AddItems();
                            },
                          );
                        });
                      },
                      child: Text("Task"),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {});
                        Navigator.pop(context);
                        final picked = await showOmniDateTimePicker(
                          type: OmniDateTimePickerType.dateAndTime,
                          context: context,
                          firstDate: DateTime(2019),
                          lastDate: DateTime(2100),
                          initialDate: selectedDate,
                          borderRadius: BorderRadius.circular(24),
                        );
                        if (picked != null) {
                          selectedDate = picked;
                        }
                      },
                      child: Text("Event"),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Icon(FontAwesomeIcons.add),
    );
  }
}

// AddThis(text: "Add Event", icon: FontAwesomeIcons.calendar);
    // SpeedDial(
    //   icon: widget.isClicked ? Icons.close : Icons.add,
    //   backgroundColor: AppColors.blackColor,
    //   foregroundColor: Colors.white,
    //   overlayColor: Colors.black,
    //   overlayOpacity: .6,
    //   renderOverlay: true,
    //   children: [
    //     SpeedDialChild(
    //       child: Icon(FontAwesomeIcons.circleCheck),
    //       onTap: () {
    //         showModalBottomSheet(
    //           context: context,
    //           builder: (context) {
    //             return AddItems();
    //           },
    //         );
    //       },
    //     ),
    //     SpeedDialChild(
    //       child: Icon(FontAwesomeIcons.calendar),
    //       onTap: () async {
    //         final DateTime now = DateTime.now();
    //         // Align minutes to the nearest lower multiple of minuteInterval
    //         final adjustedNow = DateTime(
    //           now.year,
    //           now.month,
    //           now.day,
    //           now.hour,
    //           now.minute,
    //         );
    //         DateTime? dateSelected = await showDialog(
    //           context: context,
    //           builder: (BuildContext context) {
    //             return AdoptiveCalendar(
    //               initialDate: adjustedNow,
    //               backgroundColor: AppColors.blackColor,
    //               fontColor: Colors.white,
    //               selectedColor: Colors.white,
    //               headingColor: Colors.white,
    //               iconColor: Colors.white,
    //               barForegroundColor: Colors.blueAccent,
    //               use24hFormat: true,
    //               // minuteInterval: minuteInterval,
    //               action: true,
    //               datePickerOnly: false,
    //               disablePastDates: true,
    //             );
    //           },
    //         );
    //         if (dateSelected != null && widget.onDateSelected != null) {
    //           widget.onDateSelected!(dateSelected);
    //         }
    //       },
    //     ),
    //   ],
    // );