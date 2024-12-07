import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static ThemeMode currentMode = ThemeMode.system;

  static bool get isLight => HomeBloc.currentMode == ThemeMode.light;

  HomeBloc() : super(HomeInitial()) {
    on<ToggleThemeEvent>((event, emit) {
      if (isLight) {
        currentMode = ThemeMode.dark;
      } else {
        currentMode = ThemeMode.light;
      }
      emit(ChangeThemeState(currentMode));
    });
  }
}
