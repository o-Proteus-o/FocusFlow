part of 'date_time_cubit.dart';

@immutable
sealed class DateTimeState {}

final class DateTimeInitial extends DateTimeState {}

final class DateTimeUpdated extends DateTimeState {
  late final dynamic newDateTime;

  DateTimeUpdated({required this.newDateTime});
}
