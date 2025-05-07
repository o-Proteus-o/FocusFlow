import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'date_time_state.dart';

class DateTimeCubit extends Cubit<DateTimeState> {
  DateTimeCubit() : super(DateTimeInitial());

  void dateTimeUpdated(DateTime? newDateTime) {
    emit(DateTimeUpdated(newDateTime: newDateTime));
  }
}
