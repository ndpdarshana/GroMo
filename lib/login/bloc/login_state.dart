part of 'login_bloc.dart';

class LoginState extends Equatable {
  final FormzStatus status;
  final UsernameInput usernameInput;
  final PasswordInput passwordInput;
  final bool obscurePassword;
  final AppError error;
  const LoginState({
    this.status = FormzStatus.pure,
    this.usernameInput = const UsernameInput.pure(),
    this.passwordInput = const PasswordInput.pure(),
    this.obscurePassword = true,
    this.error,
  });

  @override
  List<Object> get props => [
        status,
        usernameInput,
        passwordInput,
        obscurePassword,
        error,
      ];

  LoginState copyWith({
    FormzStatus status,
    UsernameInput usernameInput,
    PasswordInput passwordInput,
    bool obscurePassword,
    AppError error,
  }) {
    return LoginState(
      status: status ?? this.status,
      usernameInput: usernameInput ?? this.usernameInput,
      passwordInput: passwordInput ?? this.passwordInput,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      error: error ?? this.error,
    );
  }
}
