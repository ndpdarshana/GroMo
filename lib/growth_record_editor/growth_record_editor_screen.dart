import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growMo/app_localizations.dart';
import 'package:growMo/growth_record_editor/growth_save_record_button.dart';
import 'package:growMo/models/child.dart';
import 'package:growMo/growth_record_editor/bloc/growth_record_editor_bloc.dart';

class GrowthRecordEditorScreen extends StatelessWidget {
  static const String routeName = '/pods/pod_details/child_details/monito_record_editor';

  final Child child;

  const GrowthRecordEditorScreen({@required this.child}) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GrowthRecordEditorBloc(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context, AppLocalizations.of(context).translate('message_user_canceled')),
          ),
          title: Text(AppLocalizations.of(context).translate('title_new_growth_record')),
          actions: [GrowthSaveRecordButton(child: child)],
        ),
      ),
    );
  }
}
