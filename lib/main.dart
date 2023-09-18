import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:method_channel/bloc/main_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final MainBloc mainBloc = MainBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("MyhomePage"),
        ),
        body: BlocProvider(
          create: (context) => mainBloc..add(GetBatteryLevelEvent()),
          child: BlocListener<MainBloc, MainState>(
            listener: (context, state) {
              // if (state is MainInitial) {
              //   mainBloc.add(GetBatteryLevelEvent());
              // }
            },
            child: BlocBuilder<MainBloc, MainState>(
              builder: (context, state) {
                return Center(
                  child: Column(
                    children: [
                      (state is MainSuccessState)
                          ? Text(state.batteryLevel.toString())
                          : Text("Fetching battery")
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
