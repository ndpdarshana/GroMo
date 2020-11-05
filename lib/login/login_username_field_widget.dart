import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growMo/app_localizations.dart';
import 'package:growMo/login/bloc/login_bloc.dart';

class LoginUsernameField extends StatelessWidget {
  final FocusNode passwordFieldFocus;

  const LoginUsernameField({@required this.passwordFieldFocus})
      : assert(passwordFieldFocus != null);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.usernameInput != current.usernameInput,
      builder: (context, state) {
        return TextFormField(
          autocorrect: false,
          decoration: InputDecoration(
            counterStyle: TextStyle(height: 0),
            counterText: '',
            labelText:
                AppLocalizations.of(context).translate('field_label_username'),
            errorText: state.usernameInput.invalid
                ? AppLocalizations.of(context).translate('field_error_username')
                : null,
          ),
          enableSuggestions: false,
          key: ValueKey('field-username'),
          maxLength: 16,
          onChanged: (username) =>
              context.bloc<LoginBloc>().add(LoginUsernameChanged(username)),
          onFieldSubmitted: (_) =>
              FocusScope.of(context).requestFocus(passwordFieldFocus),
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
