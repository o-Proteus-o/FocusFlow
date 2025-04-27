abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoaded extends TaskState {
  final List<dynamic> taskList;

  TaskLoaded(this.taskList);
}
