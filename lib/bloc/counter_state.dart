import 'package:flutter/foundation.dart';

//Define the states
@immutable
abstract class CounterState {
  final int value;

  const CounterState(this.value);
}

class CounterStateInvalidNumber extends CounterState {
  final String invalidValue;

  const CounterStateInvalidNumber({
    required this.invalidValue,
    required int previousValue,
  }) : super(previousValue);
}

class CounterStateValidNumber extends CounterState {
  const CounterStateValidNumber(int value) : super(value);
}
