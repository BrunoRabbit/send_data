part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {
  const CounterEvent();
}

class IncrementCounter extends CounterEvent {
  final Box? quantity;

  const IncrementCounter(
    this.quantity,
  );
}

class DecrementCounter extends CounterEvent {
  final Box? quantity;

  const DecrementCounter(
    this.quantity,
  );
}
