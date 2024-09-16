import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc1/bloc/events.dart';
import 'package:multi_bloc1/bloc/state.dart';

class SwitchBloc extends Bloc<Event, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<SwitchEvent>(_onSwitchEvent);
    on<SliderEvent>(_slider);
  }

  void _onSwitchEvent(SwitchEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider(SliderEvent events, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: events.slider));
  }
}
