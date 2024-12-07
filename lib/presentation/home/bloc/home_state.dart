part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ChangeThemeState extends HomeState {
  final ThemeMode themeMode;

  ChangeThemeState(this.themeMode);
}
