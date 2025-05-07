part of 'date_time_cubit.dart';

sealed class DateTimeState {}

final class DateTimeInitial extends DateTimeState {}

final class DateTimeUpdated extends DateTimeState {
  late List<dynamic> newDateTime;

  DateTimeUpdated({required this.newDateTime});
}
