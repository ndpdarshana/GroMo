import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growMo/login/bloc/login_bloc.dart';
import 'package:growMo/login/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';
  final FocusNode passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment(1.0, 1.0),
            colors: [
              Colors.blue[100],
              Colors.blue[700],
            ],
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: BlocProvider(
          create: (context) => LoginBloc(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 120,
                    bottom: 50,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 128,
                        width: 128,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          radius: 100,
                          child: Text(
                            'GrowMo',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
