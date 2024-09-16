abstract class Event {
  Event();
  List<Object> get props => [];
}

class SwitchEvent extends Event {}

class SliderEvent extends Event {
  double slider;
  SliderEvent({required this.slider});

  @override
  List<Object> get props => [slider];
}
