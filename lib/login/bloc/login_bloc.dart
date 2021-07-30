import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '/app/bloc/app_bloc.dart';
import '/auth/bloc/auth_bloc.dart';
import '/login/password_input.dart';
import '/login/usernam_input.dart';
import '/models/app_error.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AppBloc appBloc;
  final AuthBloc authBloc;
  late StreamSubscription<AuthState> authSubscription;

  LoginBloc({required this.appBloc, required this.authBloc}) : super(LoginState()) {
    authSubscription = authBloc.stream.listen((authState) {
      if (state.status == FormzStatus.submissionInProgress) {
        if (authState.status == AuthStatus.authenticated) {
          add(LoginSuccess());
        } else if (authState.status == AuthStatus.failed) {
          add(LoginFailed(error: authState.error));
        }
      }
    });
  }

  @override
  Future<Function?> close() {
    super.close();
    return authSubscription.cancel().then((value) => value as Function?);
  }

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginUsernameChanged) {
      yield _mapLoginUsernameChangedToState(event, state);
    } else if (event is LoginPasswordChanged) {
      yield _mapLoginPasswordChangedToState(event, state);
    } else if (event is LoginPasswordObscurityToggled) {
      yield _mapLoginPasswordObscurityToggledToState(event, state);
    } else if (event is LoginSubmit) {
      yield* _mapLoginSubmitToState(event, state);
    } else if (event is LoginSuccess) {
      yield _mapLoginSuccessToState(event, state);
    } else if (event is LoginFailed) {
      yield _mapLoginFailedToState(event, state);
    }
  }

  LoginState _mapLoginUsernameChangedToState(LoginUsernameChanged event, LoginState state) {
    final usernameInput = UsernameInput.dirty(event.username);
    return state.copyWith(
      usernameInput: usernameInput,
      status: Formz.validate([usernameInput, state.passwordInput]),
    );
  }

  LoginState _mapLoginPasswordChangedToState(LoginPasswordChanged event, LoginState state) {
    final passwordInput = PasswordInput.dirty(event.password);
    return state.copyWith(
      passwordInput: passwordInput,
      status: Formz.validate([state.usernameInput, passwordInput]),
    );
  }

  LoginState _mapLoginPasswordObscurityToggledToState(LoginPasswordObscurityToggled event, LoginState state) {
    return state.copyWith(obscurePassword: !state.obscurePassword);
  }

  Stream<LoginState> _mapLoginSubmitToState(LoginSubmit event, LoginState state) async* {
    if (state.usernameInput.valid && state.passwordInput.valid) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      authBloc.add(AuthSigninRequest(username: state.usernameInput.value, password: state.passwordInput.value));
    } else {
      yield state.copyWith(
          status: FormzStatus.invalid, error: AppError(code: '1001', message: 'ID and Password required'));
    }
  }

  LoginState _mapLoginSuccessToState(LoginSuccess event, LoginState state) {
    return state.copyWith(status: FormzStatus.submissionSuccess);
  }

  LoginState _mapLoginFailedToState(LoginFailed event, LoginState state) {
    return state.copyWith(status: FormzStatus.submissionFailure, error: event.error);
  }
}
