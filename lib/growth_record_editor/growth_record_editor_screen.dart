import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/app_localizations.dart';
import '/growth_record_editor/asi_switch_field_widget.dart';
import '/growth_record_editor/bgm_switch_field_widget.dart';
import '/growth_record_editor/bloc/growth_record_editor_bloc.dart';
import '/growth_record_editor/current_date_time_widget.dart';
import '/growth_record_editor/growth_save_record_button.dart';
import '/growth_record_editor/height_scaler_field_widget.dart';
import '/growth_record_editor/immunization_switch_field_widget%20copy.dart';
import '/growth_record_editor/pmt_switch_field_widget.dart';
import '/growth_record_editor/t2_switch_field_widget.dart';
import '/growth_record_editor/va_switch_field_widget.dart';
import '/growth_record_editor/weight_scaler_field_widget.dart';
import '/models/child.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  CurrentDateTimeWidget(),
                  WeightScalerFieldWidget(),
                  HeightScalerFieldWidget(),
                  AsiSwitchFieldWidget(),
                  BgmSwitchFieldWidget(),
                  PmtSwitchFieldWidget(),
                  VaSwitchFieldWidget(),
                  T2SwitchFieldWidget(),
                  ImunizationSwitchFieldWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
