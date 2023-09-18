import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {

    const String methodChannelName = "com.methodchannel.app/battery";
    on<MainEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetBatteryLevelEvent>((event , emit) async{
      print("we are in bloc");
      const methodChannel = MethodChannel(methodChannelName);
      print("called method channel");
      int batteryPercentage = await methodChannel.invokeMethod("getBatteryLevel");
      print(batteryPercentage);
      emit(MainSuccessState(batteryLevel: batteryPercentage));
    });
  }
}
