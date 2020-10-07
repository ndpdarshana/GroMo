import 'package:flutter/material.dart';
import 'screens/edit_record_screen.dart';
import './screens/home_screem.dart';

import './screens/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GrowMo',
      theme: ThemeData(primaryColor: Colors.blue),
      home: AuthScreen(),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        EditRecordScreen.routeName: (context) => EditRecordScreen(),
      },
    );
  }
}
