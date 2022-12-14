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
