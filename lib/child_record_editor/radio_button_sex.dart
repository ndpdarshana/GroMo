import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/app_localizations.dart';
import '/child_record_editor/bloc/child_record_editor_bloc.dart';

class RadioButtonSex extends StatelessWidget {
  const RadioButtonSex();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildRecordEditorBloc, ChildRecordEditorState>(
      buildWhen: (previous, current) => previous.gender != current.gender,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.translate('field_label_gender')! + ": "),
            Container(
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.translate('field_placeholder_male')!),
                  Radio(
                    groupValue: state.gender,
                    value: Gender.male,
                    onChanged: (Gender? value) => value != null
                        ? context.read<ChildRecordEditorBloc>().add(ChildGenderRadioChanged(value))
                        : null,
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(AppLocalizations.of(context)!.translate('field_placeholder_female')!),
                  Radio(
                    groupValue: state.gender,
                    value: Gender.female,
                    onChanged: (Gender? value) => value != null
                        ? context.read<ChildRecordEditorBloc>().add(ChildGenderRadioChanged(value))
                        : null,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
