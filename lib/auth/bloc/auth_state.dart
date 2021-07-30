part of 'auth_bloc.dart';

enum AuthStatus { inProgress, unauthenticated, authenticated, failed }

class AuthState extends Equatable {
  final AuthStatus? status;
  final AppUser? user;
  final bool? loaded;
  final AppError? error;

  const AuthState({this.status, this.user, this.loaded, this.error});

  @override
  List<Object?> get props => [status, user, loaded, error];

  AuthState copyWith({AuthStatus? status, AppUser? user, bool? loaded, AppError? error}) => AuthState(
        status: status ?? this.status,
        user: user ?? this.user,
        loaded: loaded ?? this.loaded,
        error: error ?? this.error,
      );
}
