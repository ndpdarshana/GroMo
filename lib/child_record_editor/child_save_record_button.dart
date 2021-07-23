import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '/app_localizations.dart';
import '/child_record_editor/bloc/child_record_editor_bloc.dart';
import '/models/pod.dart';

class ChildSaveRecordButton extends StatelessWidget {
  final Pod pod;

  const ChildSaveRecordButton({@required this.pod}) : assert(pod != null);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildRecordEditorBloc, ChildRecordEditorState>(
      builder: (_, state) {
        return FlatButton(
          onPressed: state.status == FormzStatus.valid
              ? () => context.read<ChildRecordEditorBloc>().add(SubmitChildRecordCreateRequest(podId: pod.id))
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
