import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusflow/Features/Home/data/model/event_model.dart';
import 'package:focusflow/Features/Home/data/model/task_model.dart';
import 'package:focusflow/Features/Home/presentation/manager/date_time_cubit/date_time_cubit.dart';
import 'package:focusflow/Features/Home/presentation/manager/task_cubit/task_cubit_cubit.dart';
import 'package:focusflow/Features/Home/presentation/manager/task_cubit/task_cubit_state.dart';
import 'package:focusflow/Features/Home/presentation/views/task/widgets/event.dart';
import 'package:focusflow/Features/Home/presentation/views/task/widgets/task_list_app_bar.dart';
import 'package:focusflow/Features/Home/presentation/views/task/widgets/task_list_tile.dart';
import 'package:focusflow/constant.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});
  static const String routeName = '/task';

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  var format = DateFormat("MMM d");
  var formated = DateFormat("EEEE");
  TaskmodelDb taskmodelDb = TaskmodelDb();
  EventmodelDb eventmodelDb = EventmodelDb();

  @override
  void initState() {
    var mybox = Hive.box("taskBox");
    if (mybox.get("TODOLIST") == null) {
      taskmodelDb.createInitialData();
    } else {
      taskmodelDb.loaddata();
    }

    super.initState();
  }

  void deleteTask(int index) {
    setState(() {
      taskmodelDb.toDoList.removeAt(index);
    });
  }

  List<String> combinedList = [];
  int taskIndex = 0;
  int eventIndex = 0;

  // Populate combined list by alternating tasks and events
  // for (int i = 0; i < (tasks.length + events.length); i++) {
  //   if (i % 2 == 0 && taskIndex < tasks.length) {
  //     combinedList.add("Task: ${tasks[taskIndex]}");
  //     taskIndex++;
  //   } else if (eventIndex < events.length) {
  //     combinedList.add("Event: ${events[eventIndex]}");
  //     eventIndex++;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: AppColors.greyColor,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: TaskListAppBarr(format: format, formated: formated),
          ),
        ),
        BlocConsumer<TaskCubit, TaskState>(
          listener: (context, state) {
            if (state is TaskLoaded) {
              final tasks = state.taskList;
              taskmodelDb.toDoList = tasks;
            }
          },
          builder: (context, state) {
            if (state is TaskLoaded) {
              final tasks = state.taskList;
              return SliverList.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 60,
                    child: TaskListTile(
                      isClicked: tasks[index][1],
                      taskName: "${tasks[index][0]}",
                      taskStatus: tasks[index][1] ? "Done!" : "InProgress",
                      onChanged: (value) {
                        context.read<TaskCubit>().toggleTask(
                          index,
                          value ?? false,
                        );
                      },
                      onDelete: (context) {
                        context.read<TaskCubit>().deleteTask(index);
                      },
                    ),
                  );
                },
              );
            } else {
              return SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Make A New Task \nAnd Start Your Journey",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor.withOpacity(.6),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
          },
        ),
        BlocConsumer<DateTimeCubit, DateTimeState>(
          listener: (context, state) {
            if (state is DateTimeUpdated) {
              final event = state.newDateTime;
              eventmodelDb.eventList = event;
            }
          },
          builder: (context, state) {
            if (state is DateTimeUpdated) {
              final tasks = state.newDateTime;
              return SliverList.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 60,
                    child: EventList(
                      isClicked: false,
                      taskName: eventmodelDb.eventList[index][0],
                      taskStatus: eventmodelDb.eventList[index][1],
                    ),
                  );
                },
              );
            } else {
              return SliverToBoxAdapter(child: Center());
            }
          },
        ),
      ],
    );
  }
}
