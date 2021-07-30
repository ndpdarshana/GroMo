import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growmo/login/login_username_field_widget.dart';
import '/app_localizations.dart';
import '/login/bloc/login_bloc.dart';
import '/login/login_password_field_widget.dart';

class LoginForm extends StatelessWidget {
  final FocusNode passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        Scaffold.of(context).removeCurrentSnackBar();
        if (state.error != null) {
          String message = AppLocalizations.of(context)!.translate('error_login')!;
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
        }
      },
      child: Form(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.75),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LoginUsernameField(passwordFieldFocus: passwordFocusNode),
              LoginPasswordField(passwordFieldFocus: passwordFocusNode),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
                alignment: Alignment.center,
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      child: FlatButton(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        color: Colors.green[200],
                        child: Text(
                          AppLocalizations.of(context)!.translate('btn_login')!,
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          context.read<LoginBloc>().add(LoginSubmit());
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
