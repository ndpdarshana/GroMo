import 'package:flutter/material.dart';

import '../screens/home_screem.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        left: 40.0,
        right: 40.0,
        top: 30.0,
      ),
      alignment: Alignment.center,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: FlatButton(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              color: Colors.green[200],
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
