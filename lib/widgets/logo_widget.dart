import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 120,
        bottom: 50,
      ),
      child: Container(
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
    );
  }
}
