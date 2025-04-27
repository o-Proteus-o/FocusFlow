import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventInitial());

  final eventBox = Hive.box('eventBox');
  List eventList = [];

  void loadTasks() {
    eventList = eventBox.get("EVENTLIST", defaultValue: []);
    emit(EventLoaded(List.from(eventList)));
  }

  void addTask(String title) {
    eventList.add([title, false]);
    _updateHive();
  }

  void toggleTask(int index, bool value) {
    eventList[index][1] = value;
    _updateHive();
  }

  void deleteTask(int index) {
    eventList.removeAt(index);
    _updateHive();
  }

  void _updateHive() {
    eventBox.put("EVENTLIST", eventList);
    emit(EventLoaded(List.from(eventList))); // emit updated state
  }
}
