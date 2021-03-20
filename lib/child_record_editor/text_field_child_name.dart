import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:growMo/app_localizations.dart';
import 'package:growMo/child_record_editor/bloc/child_record_editor_bloc.dart';

enum ChildNameInputError { empty }

class ChildNameInput extends FormzInput<String, ChildNameInputError> {
  const ChildNameInput.pure() : super.pure('');
  const ChildNameInput.dirty(String value) : super.dirty(value);

  @override
  ChildNameInputError validator(String value) {
    return value?.isNotEmpty == true ? null : ChildNameInputError.empty;
  }
}

class TextFieldChildName extends StatelessWidget {
  final FocusNode childNicFieldFocus;

  const TextFieldChildName({@required this.childNicFieldFocus}) : assert(childNicFieldFocus != null);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildRecordEditorBloc, ChildRecordEditorState>(
      buildWhen: (previous, current) => previous.childNameInput != current.childNameInput,
      builder: (_, state) {
        return TextFormField(
          autocorrect: false,
          decoration: InputDecoration(
            counterStyle: TextStyle(height: 0),
            counterText: '',
            labelText: AppLocalizations.of(context).translate('field_label_child_name'),
            errorText:
                state.childNameInput.invalid ? AppLocalizations.of(context).translate('field_error_child_name') : null,
          ),
          enableSuggestions: false,
          key: ValueKey('field-child-name'),
          maxLength: 100,
          onChanged: (value) => context.read<ChildRecordEditorBloc>().add(ChildNameFieldChanged(value)),
          onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(childNicFieldFocus),
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
