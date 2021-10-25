import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '/app_localizations.dart';
import '/child_record_editor/bloc/child_record_editor_bloc.dart';

enum AddressInputError { empty }

class AddressInput extends FormzInput<String, AddressInputError> {
  const AddressInput.pure() : super.pure('');
  const AddressInput.dirty(String value) : super.dirty(value);

  @override
  AddressInputError? validator(String value) {
    return value.isNotEmpty ? null : AddressInputError.empty;
  }
}

class TextFieldAddress extends StatelessWidget {
  final FocusNode addressFieldFocus;
  final FocusNode parentNameFieldFocus;

  const TextFieldAddress({required this.addressFieldFocus, required this.parentNameFieldFocus, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildRecordEditorBloc, ChildRecordEditorState>(
      buildWhen: (previous, current) => previous.addressInput != current.addressInput,
      builder: (_, state) {
        return TextFormField(
          autocorrect: false,
          focusNode: addressFieldFocus,
          decoration: InputDecoration(
            counterStyle: const TextStyle(height: 0),
            counterText: '',
            labelText: AppLocalizations.of(context)!.translate('field_label_address'),
            errorText:
                state.addressInput.invalid ? AppLocalizations.of(context)!.translate('field_error_address') : null,
          ),
          enableSuggestions: false,
          key: const ValueKey('field-address'),
          maxLength: 100,
          onChanged: (value) => context.read<ChildRecordEditorBloc>().add(AddressFieldChanged(value)),
          onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(parentNameFieldFocus),
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
