import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:my_player/blocs/logic/cubit/internet_cubit.dart';
import 'package:my_player/blocs/presentations/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/cubit/counter_cubit.dart';

void main() {
  runApp(MyApp(
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.connectivity, Key? key}) : super(key: key);
  final Connectivity connectivity;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => InternetCubit(connectivity: connectivity)),
        BlocProvider(
            create: (context) =>
                CounterCubit(internetCubit: context.read<InternetCubit>())),
      ],
      child: MaterialApp(
        title: 'BLOC Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

// https://www.youtube.com/watch?v=w6XWjpBK4W8&list=PLptHs0ZDJKt_T-oNj_6Q98v-tBnVf-S_o