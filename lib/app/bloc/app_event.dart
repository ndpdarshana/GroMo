part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppLoaded extends AppEvent {
  const AppLoaded();

  @override
  List<Object> get props => [];
}

class AppReset extends AppEvent {}
