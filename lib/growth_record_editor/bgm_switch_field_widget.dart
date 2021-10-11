import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growmo/growth_record_editor/bloc/growth_record_editor_bloc.dart';
import '/app_localizations.dart';

class BgmSwitchFieldWidget extends StatelessWidget {
  const BgmSwitchFieldWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.translate('field_label_BGM')!,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Switch(
            value: context.select<GrowthRecordEditorBloc, bool>((bloc) => bloc.state.bgm),
            onChanged: (_) => context.read<GrowthRecordEditorBloc>().add(BGMSwitchChanged()),
          ),
        ],
      ),
    );
  }
}
