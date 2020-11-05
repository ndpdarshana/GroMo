import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growMo/app_localizations.dart';
import 'package:growMo/login/bloc/login_bloc.dart';
import 'package:growMo/login/login_password_field_widget.dart';
import 'package:growMo/login/login_username_field_widget.dart';

class LoginForm extends StatelessWidget {
  final FocusNode passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          previous.formzStatus != current.formzStatus,
      listener: (context, state) {
        Scaffold.of(context).removeCurrentSnackBar();
        if (state.appError != null) {
          String message =
              AppLocalizations.of(context).translate('error_login');
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
        }
      },
      child: Form(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LoginUsernameField(passwordFieldFocus: passwordFocusNode),
              LoginPasswordField(passwordFieldFocus: passwordFocusNode),
            ],
          ),
        ),
      ),
    );
  }
}
