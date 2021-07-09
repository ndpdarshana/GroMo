import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:growMo/app_localizations.dart';
import 'package:growMo/child_record_editor/bloc/child_record_editor_bloc.dart';

enum ParentNicInputError { empty }

class ParentNicInput extends FormzInput<String, ParentNicInputError> {
  const ParentNicInput.pure() : super.pure('');
  const ParentNicInput.dirty(String value) : super.dirty(value);

  @override
  ParentNicInputError validator(String value) {
    return value?.isNotEmpty == true ? null : ParentNicInputError.empty;
  }
}

class TextFieldParentNic extends StatelessWidget {
  final FocusNode parentNicFieldFocus;
  final FocusNode contactFieldFocus;

  const TextFieldParentNic({@required this.parentNicFieldFocus, @required this.contactFieldFocus})
      : assert(parentNicFieldFocus != null),
        assert(contactFieldFocus != null);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildRecordEditorBloc, ChildRecordEditorState>(
      buildWhen: (previous, current) => previous.parentNicInput != current.parentNicInput,
      builder: (_, state) {
        return TextFormField(
          autocorrect: false,
          focusNode: parentNicFieldFocus,
          decoration: InputDecoration(
            counterStyle: TextStyle(height: 0),
            counterText: '',
            labelText: AppLocalizations.of(context).translate('field_label_parent_nic'),
            errorText:
                state.parentNicInput.invalid ? AppLocalizations.of(context).translate('field_error_parent_nic') : null,
          ),
          enableSuggestions: false,
          key: ValueKey('field-parent-nic'),
          maxLength: 100,
          onChanged: (value) => context.read<ChildRecordEditorBloc>().add(ParentNicFieldChanged(value)),
          onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(contactFieldFocus),
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}