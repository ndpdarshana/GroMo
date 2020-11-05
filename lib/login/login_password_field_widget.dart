import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growMo/app_localizations.dart';
import 'package:growMo/login/bloc/login_bloc.dart';

class LoginPasswordField extends StatelessWidget {
  final FocusNode passwordFieldFocus;
  const LoginPasswordField({@required this.passwordFieldFocus})
      : assert(passwordFieldFocus != null);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.passwordInput != current.passwordInput ||
          previous.obscurePassword != current.obscurePassword,
      builder: (context, state) {
        return TextFormField(
          autocorrect: false,
          decoration: InputDecoration(
            counterStyle: TextStyle(height: 0),
            counterText: '',
            labelText:
                AppLocalizations.of(context).translate('field_label_password'),
            errorText: state.passwordInput.invalid
                ? AppLocalizations.of(context).translate('field_error_password')
                : null,
            suffixIcon: IconButton(
              icon: Icon(state.obscurePassword
                  ? Icons.visibility
                  : Icons.visibility_off),
              onPressed: () {
                passwordFieldFocus.unfocus();
                passwordFieldFocus.canRequestFocus = false;
                context.bloc<LoginBloc>().add(LoginPasswordObscurityToggled());
              },
            ),
          ),
          enableSuggestions: false,
          key: ValueKey('field-password'),
          focusNode: passwordFieldFocus,
          maxLength: 35,
          onChanged: (password) =>
              context.bloc<LoginBloc>().add(LoginPasswordChanged(password)),
          obscureText: state.obscurePassword,
        );
      },
    );
  }
}
