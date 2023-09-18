part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainSuccessState extends MainState{
  final int batteryLevel;

  MainSuccessState({required this.batteryLevel});
}
