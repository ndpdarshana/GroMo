import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:growMo/app/bloc/app_bloc.dart';
import 'package:growMo/auth/auth_repository.dart';
import 'package:growMo/bloc_message_service.dart';
import 'package:growMo/models/app_error.dart';
import 'package:growMo/models/app_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthLoaded) {
      yield* _mapAuthLoaded(state);
    } else if (event is AuthSigninRequest) {
      yield* _mapAuthSigninRequestToState(event, state);
    } else if (event is AuthSignoutRequest) {
      yield* _mapAuthSignoutRequestToState(event, state);
    }
  }

  Stream<AuthState> _mapAuthLoaded(AuthState state) async* {
    final result = await AuthRepository().retriveUser();
    if (result?.user != null) {
      yield state.copyWith(status: AuthStatus.authenticated);
      BlocMessagingService().publish(BlocMessage(from: AuthBloc, to: {AppBloc: AppLoaded()}));
    } else {
      await AuthRepository().signout();
      yield state.copyWith(status: AuthStatus.unauthenticated);
    }
    yield state.copyWith(loaded: true);
  }

  Stream<AuthState> _mapAuthSigninRequestToState(AuthSigninRequest event, AuthState state) async* {
    yield state.copyWith(status: AuthStatus.inProgress);

    if ((event.username?.isNotEmpty ?? false) && (event.password?.isNotEmpty ?? false)) {
      final result = await AuthRepository().signin(username: event.username, password: event.password);
      if (result.error == null && result.user != null) {
        BlocMessagingService().publish(BlocMessage(from: AuthBloc, to: {AppBloc: AppLoaded()}));
        yield state.copyWith(status: AuthStatus.authenticated, user: result.user);
      } else if (result.error != null) {
        yield state.copyWith(status: AuthStatus.failed, error: result.error);
      }
    }
  }

  Stream<AuthState> _mapAuthSignoutRequestToState(AuthSignoutRequest event, AuthState state) async* {
    yield state.copyWith(status: AuthStatus.inProgress);

    final result = await AuthRepository().signout();

    if (result.error == null) {
      yield state.copyWith(status: AuthStatus.unauthenticated);
    } else {
      yield state.copyWith(error: result.error);
    }
  }
}
