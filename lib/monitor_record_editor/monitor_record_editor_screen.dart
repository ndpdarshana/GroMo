import 'package:flutter/material.dart';
import 'package:growMo/models/child.dart';

class MonitorRecordEditorScreen extends StatelessWidget {
  static const String routeName = '/pods/pod_details/child_details/monito_record_editor';

  final Child child;

  const MonitorRecordEditorScreen({@required this.child}) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Editor ${child.name}'),
      ),
    );
  }
}
