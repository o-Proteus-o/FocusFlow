import 'package:get/get_utils/get_utils.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EventmodelDb {
  List eventList = [];

  var mybox = Hive.box("eventBox");
  void createInitialEvent() {
    eventList = [
      ["Meeting", false, DateTime.now().day, DateTime.now().hour.minutes],
    ];
  }

  void loadEvent() {
    eventList = mybox.get("EVENTLIST") ?? [];
  }

  void updateEvent() {
    mybox.put("EVENTLIST", eventList);
  }
}
