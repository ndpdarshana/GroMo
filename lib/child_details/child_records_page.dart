import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growmo/app_localizations.dart';
import 'package:growmo/child_details/bloc/child_details_bloc.dart';
import 'package:intl/intl.dart';

class ChildRecordsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChildDetailsBloc, ChildDetailsState>(
      listener: (context, state) {
        if (state.status == ChildDetailsStateStatus.failed) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error?.message ?? 'Unknown Error')));
        } else {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
        }
      },
      builder: (context, state) {
        if (state.status == ChildDetailsStateStatus.pristin) {
          return ListView.builder(
            itemCount: state.records?.length ?? 0,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.records![index].timestamp!.toDate().day.toString()),
                        Text(
                          DateFormat('MMM').format(state.records![index].timestamp!.toDate()),
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${AppLocalizations.of(context)!.translate('field_label_weight')!}: ${state.records![index].weight}',
                      ),
                      Text(
                        '${AppLocalizations.of(context)!.translate('field_label_height')!}: ${state.records![index].height}',
                      ),
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (state.records![index].asi) Text('${AppLocalizations.of(context)!.translate('label_asi')!} '),
                      if (state.records![index].bgm) Text('${AppLocalizations.of(context)!.translate('label_bgm')!} '),
                      if (state.records![index].pmt) Text('${AppLocalizations.of(context)!.translate('label_pmt')!} '),
                      if (state.records![index].vitaminA)
                        Text('${AppLocalizations.of(context)!.translate('label_vitamin_a')!} '),
                      if (state.records![index].immunization)
                        Text('${AppLocalizations.of(context)!.translate('label_immunization')!}'),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
