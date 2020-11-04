import 'package:flutter/material.dart';
import 'package:growMo/app_localizations.dart';
import 'package:growMo/widgets/submit_button.dart';
import '../widgets/customFormFields.dart';

class GrowthMonitoringScreen extends StatelessWidget {
  static const routeName = '/growthMonitor';
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gwoth Monitoring'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        key: _form,
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: AppLocalizations.of(context)
                      .translate('field_label_waight'),
                  onSaved: (value) {},
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus();
                  },
                ),
                CustomTextFormField(
                  labelText: AppLocalizations.of(context)
                      .translate('field_label_height'),
                  onSaved: (value) {},
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus();
                  },
                ),
                Row(
                  children: [
                    Text(AppLocalizations.of(context)
                        .translate('field_label_arm_height')),
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(AppLocalizations.of(context)
                        .translate('field_label_ASI')),
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(AppLocalizations.of(context)
                        .translate('field_label_BGM')),
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(AppLocalizations.of(context)
                        .translate('field_label_ASI')),
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(AppLocalizations.of(context)
                        .translate('field_label_vitamin_a')),
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(AppLocalizations.of(context)
                        .translate('field_label_2t')),
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    )
                  ],
                ),
                CustomTextFormField(
                  labelText: AppLocalizations.of(context)
                      .translate('field_label_immunization'),
                  onSaved: (value) {},
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus();
                  },
                ),
                SubmitButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
