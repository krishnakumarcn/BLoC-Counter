import 'package:bloc_counter/counter/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter Cubit', () {
    test('initial state is 0', () {
      expect(CounterCubit().state, 0);
    });

    group('increment', () {
      blocTest<CounterCubit, int>('emits [1] when state is 0',
          build: () => CounterCubit(),
          act: (cubit) => cubit.increment(),
          expect: const <int>[1]);

      blocTest<CounterCubit, int>(
        'emits [1, 2] when state is 0 and invoked twice',
        build: () => CounterCubit(),
        act: (cubit) => cubit..increment()..increment(),
        expect: const <int>[1, 2],
      );

      blocTest<CounterCubit, int>(
        'emits [8] when state is 7',
        build: () => CounterCubit(),
        seed: 7,
        act: (cubit) => cubit.increment(),
        expect: const <int>[8],
      );
    });

     group('decrement', () {
      blocTest<CounterCubit, int>(
        'emits [-1] when state is 0',
        build: () => CounterCubit(),
        act: (cubit) => cubit.decrement(),
        expect: const <int>[-1],
      );

      blocTest<CounterCubit, int>(
        'emits [-1, -2] when state is 0 and invoked twice',
        build: () => CounterCubit(),
        act: (cubit) => cubit..decrement()..decrement(),
        expect: const <int>[-1, -2],
      );

      blocTest<CounterCubit, int>(
        'emits [42] when state is 43',
        build: () => CounterCubit(),
        seed: 43,
        act: (cubit) => cubit.decrement(),
        expect: const <int>[42],
      );
    });

  });
}
