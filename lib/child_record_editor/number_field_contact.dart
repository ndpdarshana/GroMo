import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:growMo/app_localizations.dart';
import 'package:growMo/child_record_editor/bloc/child_record_editor_bloc.dart';

enum ContactInputError { empty, invalidPhoneNumber }

class ContactInput extends FormzInput<String, ContactInputError> {
  const ContactInput.pure() : super.pure('');
  const ContactInput.dirty(String value) : super.dirty(value);

  @override
  ContactInputError validator(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value?.isEmpty ?? true) {
      return ContactInputError.empty;
    } else if (!regExp.hasMatch(value)) {
      return ContactInputError.invalidPhoneNumber;
    }
    return null;
  }
}

class NumberFieldContact extends StatelessWidget {
  final FocusNode contactFieldFocus;

  const NumberFieldContact({@required this.contactFieldFocus}) : assert(contactFieldFocus != null);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildRecordEditorBloc, ChildRecordEditorState>(
      buildWhen: (previous, current) => previous.contactInput != current.contactInput,
      builder: (_, state) {
        return TextFormField(
          autocorrect: false,
          focusNode: contactFieldFocus,
          decoration: InputDecoration(
            counterStyle: TextStyle(height: 0),
            counterText: '',
            labelText: AppLocalizations.of(context).translate('field_label_contact'),
            errorText: state.contactInput.invalid
                ? state.contactInput.error == ContactInputError.invalidPhoneNumber
                    ? AppLocalizations.of(context).translate('filed_error_invalid_contact')
                    : AppLocalizations.of(context).translate('field_error_contact')
                : null,
          ),
          enableSuggestions: false,
          key: ValueKey('field-contact'),
          maxLength: 100,
          onChanged: (value) => context.read<ChildRecordEditorBloc>().add(ContactFieldChanged(value)),
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}
