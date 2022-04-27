part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final Box box;

  const CounterState(
    this.box,
  );

  CounterState copyWith({Box? box}) {
    return CounterState(this.box);
  }

  @override
  List<Object?> get props => [box];
}
