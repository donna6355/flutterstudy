import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_player/blocs/logic/cubit/counter_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLOC HOME')),
      body: Column(children: [
        const Text('COUNTER : '),
        BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Text('${state.counterValue}');
          },
        ),
        //subscribe to multi cubit/blocs, use watch!
        Builder(builder: (context) {
          final state = context.watch<CounterCubit>().state;
          return Text(
            'context.watch() test $state',
          );
        }),
        //Buildwhen is more recommended then context.select
        BlocBuilder<CounterCubit, CounterState>(
          buildWhen: (previous, current) => previous == current,
          builder: (context, state) {
            return Text('$state remains same!!!');
          },
        ),
        Builder(builder: (context) {
          final state = context.select((CounterCubit cubit) => cubit.state);
          return Text(
            'for specific value subscribe... context.select test $state',
          );
        }),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Decrement'),
            ),
          ],
        )
      ]),
    );
  }
}
