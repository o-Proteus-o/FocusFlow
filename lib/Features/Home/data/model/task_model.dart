import 'package:hive_flutter/hive_flutter.dart';

class TaskmodelDb {
  List toDoList = [];

  var mybox = Hive.box("taskBox");
  void createInitialData() {
    toDoList = [
      ["Hello There", true],
      ["Start Your Journey", false],
    ];
  }

  void loaddata() {
    toDoList = mybox.get("TASKLIST") ?? [];
  }

  void updateData() {
    mybox.put("TASKLIST", toDoList);
  }
}
