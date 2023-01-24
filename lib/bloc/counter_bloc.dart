import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

//Define the events
@immutable
abstract class CounterEvent {
  final String value;

  const CounterEvent(this.value);
}

class IncrementEvent extends CounterEvent {
  const IncrementEvent(String value) : super(value);
}

class DecrementEvent extends CounterEvent {
  const DecrementEvent(String value) : super(value);
}

//create your bloc
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterStateValidNumber(0)) {
    on<IncrementEvent>((event, emit) {
      final displayValue = int.tryParse(event.value);
      if (displayValue == null) {
        emit(CounterStateInvalidNumber(
          invalidValue: event.value,
          previousValue: state.value,
        ));
      } else {
        emit(CounterStateValidNumber(state.value + displayValue));
      }
    });
    on<DecrementEvent>(
      (event, emit) {
        final displayValue = int.tryParse(event.value);
        if (displayValue == null) {
          emit(CounterStateInvalidNumber(
            invalidValue: event.value,
            previousValue: state.value,
          ));
        } else {
          emit(CounterStateValidNumber(state.value - displayValue));
        }
      },
    );
  }
}
