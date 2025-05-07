import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusflow/Features/Home/presentation/manager/task_cubit/task_cubit_state.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial()) {
    loadTasks();
  }

  final mybox = Hive.box("taskBox"); // Consistent box name

  void loadTasks() {
    final tasks = mybox.get("TASKLIST", defaultValue: []);
    emit(TaskLoaded(List.from(tasks)));
  }

  void addTask(String title) {
    final currentState = state;
    if (currentState is TaskLoaded) {
      final newList = List.from(currentState.taskList);
      newList.add([title, false]);
      mybox.put("TASKLIST", newList);
      emit(TaskLoaded(newList));
    }
  }

  void toggleTask(int index, bool value) {
    final currentState = state;
    if (currentState is TaskLoaded) {
      final newList = List.from(currentState.taskList);
      newList[index][1] = value;
      mybox.put("TASKLIST", newList);
      emit(TaskLoaded(newList));
    }
  }

  void deleteTask(int index) {
    final currentState = state;
    if (currentState is TaskLoaded) {
      final newList = List.from(currentState.taskList);
      newList.removeAt(index);
      mybox.put("TASKLIST", newList);
      emit(TaskLoaded(newList));
    }
  }
}
