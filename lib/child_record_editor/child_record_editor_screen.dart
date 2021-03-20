import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growMo/app_localizations.dart';
import 'package:growMo/child_record_editor/bloc/child_record_editor_bloc.dart';
import 'package:growMo/child_record_editor/datetime_field_dob.dart';
import 'package:growMo/child_record_editor/number_field_contact.dart';
import 'package:growMo/child_record_editor/radio_button_sex.dart';
import 'package:growMo/child_record_editor/save_record_button.dart';
import 'package:growMo/child_record_editor/text_field_address.dart';
import 'package:growMo/child_record_editor/text_field_child_name.dart';
import 'package:growMo/child_record_editor/text_field_child_nic.dart';
import 'package:growMo/child_record_editor/text_field_parent_name.dart';
import 'package:growMo/child_record_editor/text_field_parent_nic.dart';

class ChildRecordEditorScreen extends StatelessWidget {
  static const String routeName = '/pods/pod_details/child_record_editor';

  final FocusNode childNicFieldFocusNode = FocusNode();
  final FocusNode addressFieldFocusNode = FocusNode();
  final FocusNode parentNameFieldFocusNode = FocusNode();
  final FocusNode parentNicFieldFocusNode = FocusNode();
  final FocusNode contactFieldFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChildRecordEditorBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate('title_new_child_record')),
          actions: [SaveRecordButton()],
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  TextFieldChildName(childNicFieldFocus: childNicFieldFocusNode),
                  SizedBox(height: 8),
                  TextFieldchildNic(
                      childNicFieldFocus: childNicFieldFocusNode, addressFieldFocus: addressFieldFocusNode),
                  SizedBox(height: 8),
                  RadioButtonSex(),
                  SizedBox(height: 8),
                  DateTimeFieldDob(),
                  SizedBox(height: 8),
                  TextFieldAddress(
                      addressFieldFocus: addressFieldFocusNode, parentNameFieldFocus: parentNameFieldFocusNode),
                  SizedBox(height: 8),
                  TextFieldParentName(
                      parentNameFieldFocus: parentNameFieldFocusNode, parentNicFieldFocus: parentNicFieldFocusNode),
                  SizedBox(height: 8),
                  TextFieldParentNic(
                      parentNicFieldFocus: parentNicFieldFocusNode, contactFieldFocus: contactFieldFocusNode),
                  SizedBox(height: 8),
                  NumberFieldContact(contactFieldFocus: contactFieldFocusNode),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
