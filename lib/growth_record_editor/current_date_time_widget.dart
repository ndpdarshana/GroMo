import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrentDateTimeWidget extends StatelessWidget {
  const CurrentDateTimeWidget();

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
    final String formattedText = formatter.format(now);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [Text(formattedText, style: Theme.of(context).textTheme.headline6)],
    );
  }
}
