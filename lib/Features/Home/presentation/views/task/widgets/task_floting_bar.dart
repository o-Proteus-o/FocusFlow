import 'package:flutter/material.dart';
import 'package:focusflow/Features/Home/presentation/views/task/widgets/afb_add_item.dart';
import 'package:focusflow/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FloatingBar extends StatelessWidget {
  const FloatingBar({super.key, required this.isClicked});
  final bool isClicked;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.greyColor,
      foregroundColor: AppColors.blackColor,
      child: Icon(FontAwesomeIcons.add),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(width: 1.5, color: AppColors.blackColor),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Add Task",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              // titlePadding: EdgeInsets.only(bottom: 10),
              content: AddItems(),
            );
          },
        );
      },
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