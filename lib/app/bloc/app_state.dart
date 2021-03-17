part of 'app_bloc.dart';

enum AppStatus { unknown, done }

class AppState extends Equatable {
  final AppStatus status;
  const AppState({this.status = AppStatus.unknown});

  @override
  List<Object> get props => [status];

  AppState copyWith({AppStatus status}) {
    return AppState(status: status ?? this.status);
  }
}
