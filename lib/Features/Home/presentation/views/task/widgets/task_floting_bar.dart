import 'package:adoptive_calendar/adoptive_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:focusflow/Features/Home/presentation/views/task/widgets/afb_add_item.dart';
import 'package:focusflow/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FloatingBar extends StatefulWidget {
  const FloatingBar({super.key, required this.isClicked, this.onDateSelected});

  final bool isClicked;
  final void Function(DateTime)? onDateSelected;

  @override
  State<FloatingBar> createState() => _FloatingBarState();
}

class _FloatingBarState extends State<FloatingBar> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: widget.isClicked ? Icons.close : Icons.add,
      backgroundColor: AppColors.blackColor,
      foregroundColor: Colors.white,
      overlayColor: Colors.black,
      overlayOpacity: .6,
      renderOverlay: true,
      children: [
        SpeedDialChild(
          child: Icon(FontAwesomeIcons.circleCheck),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddItems();
              },
            );
          },
        ),
        SpeedDialChild(
          child: Icon(FontAwesomeIcons.calendar),
          onTap: () async {
            final DateTime now = DateTime.now();
            // Align minutes to the nearest lower multiple of minuteInterval
            final adjustedNow = DateTime(
              now.year,
              now.month,
              now.day,
              now.hour,
              now.minute,
            );
            DateTime? dateSelected = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AdoptiveCalendar(
                  initialDate: adjustedNow,
                  backgroundColor: AppColors.blackColor,
                  fontColor: Colors.white,
                  selectedColor: Colors.white,
                  headingColor: Colors.white,
                  iconColor: Colors.white,
                  barForegroundColor: Colors.blueAccent,
                  use24hFormat: true,
                  // minuteInterval: minuteInterval,
                  action: true,
                  datePickerOnly: false,
                  disablePastDates: true,
                );
              },
            );
            if (dateSelected != null && widget.onDateSelected != null) {
              widget.onDateSelected!(dateSelected);
            }
          },
        ),
      ],
    );
  }
}
