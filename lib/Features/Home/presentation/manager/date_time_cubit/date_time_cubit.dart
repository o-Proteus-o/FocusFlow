import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';

part 'date_time_state.dart';

class DateTimeCubit extends Cubit<DateTimeState> {
  DateTimeCubit() : super(DateTimeInitial());

  final myevent = Hive.box("eventBox");

  void loadEvent() {
    final event = myevent.get("eventList");
    emit(DateTimeUpdated(newDateTime: List.from(event)));
  }

  void addDataTime(DateTime newDate) {
    final currentTime = state;
    if (currentTime is DateTimeUpdated) {
      final newDaTi = List.from(currentTime.newDateTime);
      newDaTi.add(newDate);
      myevent.put("eventList", newDate);
      emit(DateTimeUpdated(newDateTime: newDaTi));
    }
  }

  void toggleEvents(int index, bool value) {
    final currentTime = state;
    if (currentTime is DateTimeUpdated) {
      final newDaTi = List.from(currentTime.newDateTime);
      newDaTi[index][1] = value;
      myevent.put("eventList", newDaTi);
      emit(DateTimeUpdated(newDateTime: newDaTi));
    }
  }

  void deleteEvent(int index) {
    final currentTime = state;
    if (currentTime is DateTimeUpdated) {
      final newDaTi = List.from(currentTime.newDateTime);
      newDaTi.removeAt(index);
      myevent.put("eventList", newDaTi);
      emit(DateTimeUpdated(newDateTime: newDaTi));
    }
  }
}
