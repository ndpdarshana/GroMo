import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '/app_localizations.dart';
import '/child_record_editor/bloc/child_record_editor_bloc.dart';

enum ChildNicInputError { empty }

class ChildNicInput extends FormzInput<String, ChildNicInputError> {
  const ChildNicInput.pure() : super.pure('');
  const ChildNicInput.dirty(String value) : super.dirty(value);

  @override
  ChildNicInputError? validator(String value) {
    return value.isNotEmpty ? null : ChildNicInputError.empty;
  }
}

class TextFieldchildNic extends StatelessWidget {
  final FocusNode childNicFieldFocus;
  final FocusNode addressFieldFocus;

  const TextFieldchildNic({required this.childNicFieldFocus, required this.addressFieldFocus, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildRecordEditorBloc, ChildRecordEditorState>(
      buildWhen: (previous, current) => previous.childNicInput != current.childNicInput,
      builder: (_, state) {
        return TextFormField(
          autocorrect: false,
          focusNode: childNicFieldFocus,
          decoration: InputDecoration(
            counterStyle: const TextStyle(height: 0),
            counterText: '',
            labelText: AppLocalizations.of(context)!.translate('field_label_child_nic'),
            errorText:
                state.childNicInput.invalid ? AppLocalizations.of(context)!.translate('field_error_child_nic') : null,
          ),
          enableSuggestions: false,
          key: const ValueKey('field-child-nic'),
          maxLength: 100,
          onChanged: (value) => context.read<ChildRecordEditorBloc>().add(ChildNicFieldChanged(value)),
          onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(addressFieldFocus),
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
