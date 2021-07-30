import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '/app_localizations.dart';
import '/child_record_editor/bloc/child_record_editor_bloc.dart';
import 'package:intl/intl.dart';

enum DobInputError { empty, invalid }

class DobInput extends FormzInput<DateTime?, DobInputError> {
  const DobInput.pure() : super.pure(null);
  const DobInput.dirty(DateTime? value) : super.dirty(value);

  @override
  DobInputError? validator(DateTime? value) {
    if (value == null) {
      return DobInputError.empty;
    } else if (value.isAfter(DateTime.now())) {
      return DobInputError.invalid;
    }
    return null;
  }
}

class DateTimeFieldDob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildRecordEditorBloc, ChildRecordEditorState>(
      buildWhen: (previous, current) => previous.dobInput != current.dobInput,
      builder: (context, state) {
        return Container(
          height: 70,
          child: Row(
            children: [
              Text('${AppLocalizations.of(context)!.translate('field_label_dob')}: '),
              Expanded(
                  child: Text(
                state.dobInput.valid
                    ? DateFormat.yMd().format(state.dobInput.value!)
                    : state.dobInput.invalid
                        ? AppLocalizations.of(context)!.translate('field_error_dob')!
                        : AppLocalizations.of(context)!.translate('field_placeholder_dob')!,
                style: state.dobInput.invalid ? TextStyle(color: Theme.of(context).errorColor) : null,
              )),
              TextButton(
                child: Text(
                  AppLocalizations.of(context)!.translate('btn_date_picker')!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now().subtract(Duration(days: 365)),
                          lastDate: DateTime.now())
                      .then((pickedDate) {
                    context.read<ChildRecordEditorBloc>().add(ChildDobChanged(pickedDate));
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
