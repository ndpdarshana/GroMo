import 'package:flutter/material.dart';
import 'package:growMo/app_localizations.dart';
import 'package:growMo/widgets/submit_button.dart';
import 'package:intl/intl.dart';
import 'home_screen.dart';

import '../widgets/customFormFields.dart';

class EditRecordScreen extends StatefulWidget {
  static const routeName = '/newRecoord';

  @override
  _EditRecordScreenState createState() => _EditRecordScreenState();
}

class _EditRecordScreenState extends State<EditRecordScreen> {
  final _form = GlobalKey<FormState>();
  DateTime _selectedDate;

  final _nikFocusNode = FocusNode();
  final _dobFocusNode = FocusNode();

  @override
  void dispose() {
    _nikFocusNode.dispose();
    _dobFocusNode.dispose();
    super.dispose();
  }

  void _openDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        this._selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Record'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        key: _form,
        child: Form(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextFormField(
                labelText: 'Name',
                onSaved: (value) {},
              ),
              CustomTextFormField(
                labelText: 'NIK',
                onSaved: (value) {},
                focusNode: _nikFocusNode,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)
                          .translate('field_label_gender') +
                      ": "),
                  Container(
                    child: Row(
                      children: [
                        Text(AppLocalizations.of(context)
                            .translate('field_placeholder_male')),
                        Radio(
                          groupValue: null,
                          value: 1,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(AppLocalizations.of(context)
                            .translate('field_placeholder_female')),
                        Radio(
                          groupValue: null,
                          value: 0,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Text('Date of Birth: '),
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No date choosed'
                          : DateFormat.yMd().format(_selectedDate)),
                    ),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      focusNode: _dobFocusNode,
                      child: Text(
                        'Pick a Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: _openDatePicker,
                    ),
                  ],
                ),
              ),
              CustomTextFormField(
                labelText: 'Address',
                onSaved: (value) {},
              ),
              CustomTextFormField(
                labelText: 'Parent\'s name',
                onSaved: (value) {},
              ),
              CustomTextFormField(
                labelText: 'Parent\'s NIK',
                onSaved: (value) {},
              ),
              CustomTextFormField(
                labelText: 'Contact number',
                onSaved: (value) {},
              ),
              SubmitButton()
            ],
          ),
        )),
      ),
    );
  }
}
