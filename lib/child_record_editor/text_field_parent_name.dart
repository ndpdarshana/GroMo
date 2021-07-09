import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:growMo/app_localizations.dart';
import 'package:growMo/child_record_editor/bloc/child_record_editor_bloc.dart';

enum ParentNameInputError { empty }

class ParentNameInput extends FormzInput<String, ParentNameInputError> {
  const ParentNameInput.pure() : super.pure('');
  const ParentNameInput.dirty(String value) : super.dirty(value);

  @override
  ParentNameInputError validator(String value) {
    return value?.isNotEmpty == true ? null : ParentNameInputError.empty;
  }
}

class TextFieldParentName extends StatelessWidget {
  final FocusNode parentNameFieldFocus;
  final FocusNode parentNicFieldFocus;

  const TextFieldParentName({@required this.parentNameFieldFocus, @required this.parentNicFieldFocus})
      : assert(parentNameFieldFocus != null),
        assert(parentNicFieldFocus != null);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildRecordEditorBloc, ChildRecordEditorState>(
      buildWhen: (previous, current) => previous.parentNameInput != current.parentNameInput,
      builder: (_, state) {
        return TextFormField(
          autocorrect: false,
          focusNode: parentNameFieldFocus,
          decoration: InputDecoration(
            counterStyle: TextStyle(height: 0),
            counterText: '',
            labelText: AppLocalizations.of(context).translate('field_label_parent_name'),
            errorText: state.parentNameInput.invalid
                ? AppLocalizations.of(context).translate('field_error_parent_name')
                : null,
          ),
          enableSuggestions: false,
          key: ValueKey('field-parent-name'),
          maxLength: 100,
          onChanged: (value) => context.read<ChildRecordEditorBloc>().add(ParentNameFieldChanged(value)),
          onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(parentNicFieldFocus),
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}