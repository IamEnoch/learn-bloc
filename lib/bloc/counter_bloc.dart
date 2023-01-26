import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc_project/bloc/counter_event.dart';
import 'package:my_bloc_project/bloc/counter_state.dart';

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
