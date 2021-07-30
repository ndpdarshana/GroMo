part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLoaded extends AuthEvent {
  const AuthLoaded();

  @override
  List<Object> get props => [];
}

class AuthSigninRequest extends AuthEvent {
  final String username;
  final String password;
  const AuthSigninRequest({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}

class AuthSignoutRequest extends AuthEvent {
  const AuthSignoutRequest();

  @override
  List<Object> get props => [];
}
