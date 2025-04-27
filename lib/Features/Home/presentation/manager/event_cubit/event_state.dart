part of 'event_cubit.dart';

@immutable
sealed class EventState {}

final class EventInitial extends EventState {}

final class EventLoaded extends EventState {
  final List<dynamic> eventList;

  EventLoaded(this.eventList);
}
