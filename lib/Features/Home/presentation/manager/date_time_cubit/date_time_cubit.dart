import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';

part 'date_time_state.dart';

class DateTimeCubit extends Cubit<DateTimeState> {
  DateTimeCubit() : super(DateTimeInitial());

  final myevent = Hive.box("eventBox");

  void loadEvent() {
    final event = myevent.get("EVENTLIST");
    emit(DateTimeUpdated(newDateTime: List.from(event)));
  }

  void addDataTime(DateTime newDate) {
    final currentTime = state;
    if (currentTime is DateTimeUpdated) {
      final newDaTi = List.from(currentTime.newDateTime);
      newDaTi.add(newDate);
      myevent.put("EVENTLIST", newDate);
      emit(DateTimeUpdated(newDateTime: newDaTi));
    }
  }

  void toggleEvents(int index, bool value) {
    final currentTime = state;
    if (currentTime is DateTimeUpdated) {
      final newDaTi = List.from(currentTime.newDateTime);
      newDaTi[index][1] = value;
      myevent.put("EVENTLIST", newDaTi);
      emit(DateTimeUpdated(newDateTime: newDaTi));
    }
  }

  void deleteEvent(int index) {
    final currentTime = state;
    if (currentTime is DateTimeUpdated) {
      final newDaTi = List.from(currentTime.newDateTime);
      newDaTi.removeAt(index);
      myevent.put("EVENTLIST", newDaTi);
      emit(DateTimeUpdated(newDateTime: newDaTi));
    }
  }
}
