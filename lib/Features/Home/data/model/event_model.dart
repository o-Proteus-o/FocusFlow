import 'package:hive_flutter/hive_flutter.dart';

class EventmodelDb {
  List eventList = [];

  var mybox = Hive.box("eventBox");
  // void createInitialData() {
  //   EventList = [
  //   ];
  // }

  void loaddata() {
    eventList = mybox.get("EVENTLIST") ?? [];
  }

  void updateData() {
    mybox.put("EVENTLIST", eventList);
  }
}
