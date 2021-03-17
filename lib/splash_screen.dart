import 'package:flutter/material.dart';
import 'package:growMo/widgets/logo_widget.dart';

class SplashScreen extends StatelessWidget {
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
        child: LogoWidget(),
      ),
    );
  }
}
