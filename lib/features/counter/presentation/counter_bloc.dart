import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cursor_demo/features/counter/domain/increment_counter_usecase.dart';
import 'package:cursor_demo/features/counter/domain/decrement_counter_usecase.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final IncrementCounterUseCase _incrementCounterUseCase;
  final DecrementCounterUseCase _decrementCounterUseCase;

  CounterBloc(this._incrementCounterUseCase, this._decrementCounterUseCase) : super(const CounterState(0)) {
    on<CounterStarted>(_onCounterStarted);
    on<CounterIncremented>(_onCounterIncremented);
    on<CounterDecremented>(_onCounterDecremented);
  }

  Future<void> _onCounterStarted(CounterStarted event, Emitter<CounterState> emit) async {
    final currentCounter = await _incrementCounterUseCase.callStream;
    emit(CounterState(currentCounter));
  }

  Future<void> _onCounterIncremented(CounterIncremented event, Emitter<CounterState> emit) async {
    await _incrementCounterUseCase.call();
    final currentCounter = await _incrementCounterUseCase.callStream;
    emit(CounterState(currentCounter));
  }

  Future<void> _onCounterDecremented(CounterDecremented event, Emitter<CounterState> emit) async {
    await _decrementCounterUseCase.call();
    final currentCounter = await _incrementCounterUseCase.callStream;
    emit(CounterState(currentCounter));
  }
}
