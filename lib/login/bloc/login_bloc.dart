import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:growMo/login/password_input.dart';
import 'package:growMo/login/usernam_input.dart';
import 'package:growMo/models/AppError.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginUsernameChanged) {
      final usernameInput = UsernameInput.dirty(event.username);
      print(Formz.validate([usernameInput]));

      print(usernameInput.error);
      print(usernameInput.valid);
      print(usernameInput.status);
      print(usernameInput.toString());
      print(usernameInput.value);
      yield state.copyWith(
        usernameInput: usernameInput,
        formzStatus: Formz.validate([
          usernameInput,
          state.passwordInput,
        ]),
      );
    } else if (event is LoginPasswordChanged) {
      final passwordInput = PasswordInput.dirty(event.password);

      print(passwordInput.error);
      print(passwordInput.valid);
      print(passwordInput.status);
      print(passwordInput.toString());
      print(passwordInput.value);
      yield state.copyWith(passwordInput: passwordInput);
    } else if (event is LoginPasswordObscurityToggled) {
      yield state.copyWith(obscurePassword: !state.obscurePassword);
    }
  }
}
