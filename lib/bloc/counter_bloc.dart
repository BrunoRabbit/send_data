import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_data/model/box.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(Box(0))) {
    on<IncrementCounter>((event, emit) {
      emit(CounterState(Box(state.box.quantity! + 1)));
    });

    on<DecrementCounter>((event, emit) {
      emit(CounterState(Box(state.box.quantity! - 1)));
    });
  }
}
