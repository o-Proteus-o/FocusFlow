import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventInitial()) {
    loadEvents();
  }

  final mybox = Hive.box("eventBox"); // Consistent box name

  void loadEvents() {
    final events = mybox.get("EventLIST", defaultValue: []);
    emit(EventLoaded(List.from(events)));
  }

  void addEvent(String title, DateTime day, DateTime time) {
    final currentState = state;
    if (currentState is EventLoaded) {
      final newEventList = List.from(currentState.eventList);
      newEventList.add([title, day, time]);
      mybox.put("EventLIST", newEventList);
      emit(EventLoaded(newEventList));
    }
  }

  void toggleEvent(int index, bool value) {
    final currentState = state;
    if (currentState is EventLoaded) {
      final newEventList = List.from(currentState.eventList);
      newEventList[index][1] = value;
      mybox.put("EventLIST", newEventList);
      emit(EventLoaded(newEventList));
    }
  }

  void deleteEvent(int index) {
    final currentState = state;
    if (currentState is EventLoaded) {
      final newEventList = List.from(currentState.eventList);
      newEventList.removeAt(index);
      mybox.put("EventLIST", newEventList);
      emit(EventLoaded(newEventList));
    }
  }
}
