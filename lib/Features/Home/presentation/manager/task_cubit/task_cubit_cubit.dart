import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focusflow/Features/Home/presentation/manager/task_cubit/task_cubit_state.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  final mybox = Hive.box("taskBox");
  List<dynamic> toDoList = [];

  void loadTasks() {
    toDoList = mybox.get("TASKLIST", defaultValue: []);
    emit(TaskLoaded(List.from(toDoList)));
  }

  void addTask(String title) {
    toDoList.add([title, false]);
    _updateHive();
  }

  void toggleTask(int index, bool value) {
    toDoList[index][1] = value;
    _updateHive();
  }

  void deleteTask(int index) {
    toDoList.removeAt(index);
    _updateHive();
  }

  void _updateHive() {
    mybox.put("TASKLIST", toDoList);
    emit(TaskLoaded(List.from(toDoList)));
  }
}
