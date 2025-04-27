import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:focusflow/constant.dart';

class TaskListTile extends StatefulWidget {
  final bool isClicked;
  final String taskName;
  final String taskStatus;
  final void Function(bool?)? onChanged;
  final void Function(BuildContext)? onPressed;
  const TaskListTile({
    super.key,
    required this.isClicked,
    required this.taskName,
    this.onChanged,
    required this.taskStatus,
    required this.onPressed,
  });

  @override
  State<TaskListTile> createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 14, right: 14),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: widget.onPressed,
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
            color: AppColors.blackColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              SizedBox(width: 10),
              Text(
                widget.taskName,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              Spacer(),
              Text(
                widget.taskStatus,
                style: TextStyle(
                  color: widget.isClicked ? Colors.green : Colors.blue,
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
