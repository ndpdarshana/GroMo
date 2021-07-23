import 'package:flutter/material.dart';
import '/app_localizations.dart';

class WeightScalerFieldWidget extends StatelessWidget {
  const WeightScalerFieldWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).translate('field_label_weight'),
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Row(
            children: [
              Expanded(child: Slider(value: 0, onChanged: (value) {})),
              Container(width: 80, child: TextFormField()),
            ],
          ),
        ],
      ),
    );
  }
}
