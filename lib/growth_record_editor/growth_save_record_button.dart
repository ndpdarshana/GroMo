import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:growMo/app_localizations.dart';
import 'package:growMo/growth_record_editor/bloc/growth_record_editor_bloc.dart';
import 'package:growMo/models/child.dart';

class GrowthSaveRecordButton extends StatelessWidget {
  final Child child;

  const GrowthSaveRecordButton({@required this.child}) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GrowthRecordEditorBloc, GrowthRecordEditorState>(
      builder: (_, state) {
        return FlatButton(
          onPressed: state.status == FormzStatus.valid
              ? () => context.read<GrowthRecordEditorBloc>().add(GrowthRecordSubmitted())
              : null,
          child: Text(
            AppLocalizations.of(context).translate('btn_save'),
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}
