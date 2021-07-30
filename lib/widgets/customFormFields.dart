import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final FocusNode? focusNode;
  final String? labelText;
  final Function? onSaved;
  final Function? onFieldSubmitted;
  final Function? fieldValidator;
  final dynamic initValue;

  CustomTextFormField(
      {this.focusNode,
      required this.labelText,
      required this.onSaved,
      this.onFieldSubmitted,
      this.fieldValidator,
      this.initValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: this.labelText),
      textInputAction: TextInputAction.next,
      focusNode: focusNode,
      onFieldSubmitted: this.onFieldSubmitted as void Function(String)?,
      validator: fieldValidator as String? Function(String?)?,
      onSaved: this.onSaved as void Function(String?)?,
      initialValue: this.initValue,
    );
  }
}
