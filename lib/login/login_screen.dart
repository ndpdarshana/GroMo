import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '/app/bloc/app_bloc.dart';
import '/auth/bloc/auth_bloc.dart';
import '/login/bloc/login_bloc.dart';
import '/login/login_form_widget.dart';
import '/widgets/loading_indecator.dart';
import '/widgets/logo_widget.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';
  final FocusNode passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(appBloc: context.read<AppBloc>(), authBloc: context.read<AuthBloc>()),
      child: Stack(
        children: [
          Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment(1.0, 1.0),
                  colors: [
                    Colors.blue[100]!,
                    Colors.blue[700]!,
                  ],
                ),
              ),
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LogoWidget(),
                    LoginForm(),
                  ],
                ),
              ),
            ),
          ),
          BlocBuilder<LoginBloc, LoginState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (_, state) {
              return LoadingIndecator(
                visible:
                    state.status == FormzStatus.submissionInProgress || state.status == FormzStatus.submissionSuccess,
              );
            },
          )
        ],
      ),
    );
  }
}
