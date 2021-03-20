import 'package:flutter/material.dart';
import 'package:growMo/app_localizations.dart';

class SaveRecordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Text(
        AppLocalizations.of(context).translate('btn_save'),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
