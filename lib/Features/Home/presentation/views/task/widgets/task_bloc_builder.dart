import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusflow/Features/Home/data/model/task_model.dart';
import 'package:focusflow/Features/Home/presentation/manager/task_cubit/task_cubit_cubit.dart';
import 'package:focusflow/Features/Home/presentation/manager/task_cubit/task_cubit_state.dart';
import 'package:focusflow/Features/Home/presentation/views/task/widgets/task_list_tile.dart';
import 'package:focusflow/constant.dart';

class TaskBlocBuilder extends StatelessWidget {
  const TaskBlocBuilder({super.key, required this.taskmodelDb});

  final TaskmodelDb taskmodelDb;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskState>(
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
                    context.read<TaskCubit>().toggleTask(index, value ?? false);
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
    );
  }
}
