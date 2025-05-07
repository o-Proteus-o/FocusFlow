import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'clock_state.dart';

class ClockCubit extends Cubit<ClockState> {
  ClockCubit() : super(ClockInitial());
}
