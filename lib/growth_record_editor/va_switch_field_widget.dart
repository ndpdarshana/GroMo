import 'package:flutter/material.dart';
import 'package:growMo/app_localizations.dart';

class VaSwitchFieldWidget extends StatelessWidget {
  const VaSwitchFieldWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context).translate('field_label_vitamin_a'),
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Switch(value: false, onChanged: (value) {}),
        ],
      ),
    );
  }
}
