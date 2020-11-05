part of 'login_bloc.dart';

class LoginState extends Equatable {
  final FormzStatus formzStatus;
  final UsernameInput usernameInput;
  final PasswordInput passwordInput;
  final bool obscurePassword;
  final AppError appError;
  const LoginState({
    this.formzStatus = FormzStatus.pure,
    this.usernameInput = const UsernameInput.pure(),
    this.passwordInput = const PasswordInput.pure(),
    this.obscurePassword = true,
    this.appError,
  });

  @override
  List<Object> get props => [
        formzStatus,
        usernameInput,
        passwordInput,
        obscurePassword,
        appError,
      ];

  LoginState copyWith({
    FormzStatus formzStatus,
    UsernameInput usernameInput,
    PasswordInput passwordInput,
    bool obscurePassword,
    AppError appError,
  }) {
    return LoginState(
      formzStatus: formzStatus ?? this.formzStatus,
      usernameInput: usernameInput ?? this.usernameInput,
      passwordInput: passwordInput ?? this.passwordInput,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      appError: appError ?? this.appError,
    );
  }
}
