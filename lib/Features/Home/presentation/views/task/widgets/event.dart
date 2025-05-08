import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:focusflow/constant.dart';
import 'package:intl/intl.dart';

class EventList extends StatefulWidget {
  final bool isClicked;
  final String taskName;
  final DateTime time;
  final void Function(bool?)? onChanged;
  final void Function(BuildContext)? onDelete;
  const EventList({
    super.key,
    required this.isClicked,
    required this.taskName,
    required this.time,
    this.onChanged,
    this.onDelete,
  });

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  String formatDateTime(DateTime dateTime) {
    return DateFormat('EEEE, MMM d — h:mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 14, right: 14),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: widget.onDelete,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(16),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.pinkColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              SizedBox(width: 10),
              Row(
                children: [
                  Text(
                    widget.taskName,
                    style: TextStyle(fontSize: 16, color: AppColors.blackColor),
                  ),
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 5,
                  bottom: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.greyColor,
                ),
                child: Text(
                  "${widget.time}",
                  style: TextStyle(fontSize: 16, color: AppColors.blackColor),
                ),
              ),
              Checkbox(
                value: widget.isClicked,
                checkColor: Colors.white,
                activeColor: AppColors.blackColor,
                onChanged: widget.onChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
