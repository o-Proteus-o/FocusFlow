part of 'event_cubit.dart';

sealed class EventState {}

final class EventInitial extends EventState {}

final class EventLoaded extends EventState {
  final List<dynamic> eventList;
  EventLoaded(this.eventList);
}
