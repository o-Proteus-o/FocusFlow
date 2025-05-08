import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusflow/Features/Home/data/model/event_model.dart';
import 'package:focusflow/Features/Home/data/model/task_model.dart';
import 'package:focusflow/Features/Home/presentation/manager/event_cubit/event_cubit.dart';
import 'package:focusflow/Features/Home/presentation/views/task/widgets/event.dart';
import 'package:focusflow/Features/Home/presentation/views/task/widgets/task_bloc_builder.dart';
import 'package:focusflow/Features/Home/presentation/views/task/widgets/task_list_app_bar.dart';
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
  EventmodelDb eventModelDb = EventmodelDb();

  @override
  void initState() {
    var mybox = Hive.box("taskBox");
    if (mybox.get("TODOLIST") == null) {
      taskmodelDb.createInitialData();
    } else {
      taskmodelDb.loaddata();
    }

    var myEvent = Hive.box("name");
    if (myEvent.get("EventList") == null) {
      eventModelDb.createInitialEvent();
    } else {
      eventModelDb.loadEvent();
    }
    super.initState();
  }

  void deleteTask(int index) {
    setState(() {
      taskmodelDb.toDoList.removeAt(index);
    });
  }

  void deleteEvent(int index) {
    setState(() {
      eventModelDb.eventList.removeAt(index);
    });
  }

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
        TaskBlocBuilder(taskmodelDb: taskmodelDb),

        BlocConsumer<EventCubit, EventState>(
          listener: (context, state) {
            if (state is EventLoaded) {
              final event = state.eventList;
              eventModelDb.eventList = event;
            }
          },
          builder: (context, state) {
            if (state is EventLoaded) {
              final event = state.eventList;

              return SliverList.builder(
                itemCount: event.length,
                itemBuilder: (context, index) {
                  return EventList(
                    isClicked: event[index][1],
                    taskName: event[index][2],
                    time: event[3],
                    onChanged: (value) {
                      // context.read<EventCubit>().toggleEvent(index, value, day, time);
                    },
                    onDelete: (ind) {
                      context.read<EventCubit>().deleteEvent(index);
                    },
                  );
                },
              );
            } else {
              return SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Make A New Task Or Event \nAnd Start Your Journey",
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
      ],
    );
  }
}
