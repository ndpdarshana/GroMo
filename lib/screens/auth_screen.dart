import 'package:flutter/material.dart';
import '../screens/home_screem.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

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
              LoginInputField(
                icon: Icons.email,
                hint: '',
                isPassword: false,
              ),
              LoginInputField(
                icon: Icons.lock_open,
                hint: '',
                isPassword: true,
              ),
              Container(
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
                          'Log In',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginInputField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool isPassword;

  const LoginInputField({
    @required this.icon,
    this.hint,
    @required this.isPassword,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 40, right: 40),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 0.5,
            style: BorderStyle.solid,
          ),
        ),
      ),
      padding: EdgeInsets.only(
        left: 0.0,
        right: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              right: 0,
            ),
            child: Icon(
              this.icon,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: this.hint,
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
