part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginUsernameChanged extends LoginEvent {
  final String username;
  const LoginUsernameChanged(this.username);

  @override
  List<Object> get props => [username];
}

class LoginPasswordChanged extends LoginEvent {
  final String password;
  const LoginPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class LoginPasswordObscurityToggled extends LoginEvent {
  const LoginPasswordObscurityToggled();

  @override
  List<Object> get props => [];
}

class LoginSubmit extends LoginEvent {
  const LoginSubmit();

  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginEvent {
  const LoginSuccess();

  @override
  List<Object> get props => [];
}

class LoginFailed extends LoginEvent {
  final AppError? error;
  const LoginFailed({this.error});

  @override
  List<Object?> get props => [error];
}
