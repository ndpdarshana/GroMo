import 'package:flutter/material.dart';
import '/app_localizations.dart';

class T2SwitchFieldWidget extends StatelessWidget {
  const T2SwitchFieldWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.translate('field_label_2t')!,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Switch(value: false, onChanged: (value) {}),
        ],
      ),
    );
  }
}
