import 'package:flutter/material.dart';
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
                  labelText: 'Wight',
                  onSaved: (value) {},
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus();
                  },
                ),
                CustomTextFormField(
                  labelText: 'Height',
                  onSaved: (value) {},
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus();
                  },
                ),
                Row(
                  children: [
                    Text('BGM'),
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    )
                  ],
                ),
                Row(
                  children: [
                    Text('ASI Exclusive'),
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    )
                  ],
                ),
                CustomTextFormField(
                  labelText: 'PMT',
                  onSaved: (value) {},
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus();
                  },
                ),
                CustomTextFormField(
                  labelText: 'Vitamin A',
                  onSaved: (value) {},
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus();
                  },
                ),
                CustomTextFormField(
                  labelText: 'Immunization',
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
