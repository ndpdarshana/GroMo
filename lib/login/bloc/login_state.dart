part of 'login_bloc.dart';

class LoginState extends Equatable {
  final FormzStatus formzStatus;
  final UsernameInput usernameInput;
  final PasswordInput passwordInput;
  const LoginState({
    this.formzStatus = FormzStatus.pure,
    this.usernameInput = const UsernameInput.pure(),
    this.passwordInput = const PasswordInput.pure(),
  });

  @override
  List<Object> get props => [
        formzStatus,
        usernameInput,
        passwordInput,
      ];

  LoginState copyWith({
    FormzStatus formzStatus,
    UsernameInput usernameInput,
    PasswordInput passwordInput,
  }) {
    return LoginState(
      formzStatus: formzStatus ?? this.formzStatus,
      usernameInput: usernameInput ?? this.usernameInput,
      passwordInput: passwordInput ?? this.passwordInput,
    );
  }
}
