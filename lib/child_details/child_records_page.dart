import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growmo/app_localizations.dart';
import 'package:growmo/child_details/bloc/child_details_bloc.dart';
import 'package:intl/intl.dart';

class ChildRecordsPage extends StatelessWidget {
  const ChildRecordsPage({Key? key}) : super(key: key);

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
                          style: const TextStyle(fontSize: 10),
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
                  subtitle: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (state.records![index].asi)
                            _LabelText(AppLocalizations.of(context)!.translate('label_asi')!),
                          if (state.records![index].bgm)
                            _LabelText(AppLocalizations.of(context)!.translate('label_bgm')!),
                          if (state.records![index].pmt)
                            _LabelText(AppLocalizations.of(context)!.translate('label_pmt')!),
                          if (state.records![index].vitaminA)
                            _LabelText(AppLocalizations.of(context)!.translate('label_vitamin_a')!),
                          if (state.records![index].immunization)
                            _LabelText(AppLocalizations.of(context)!.translate('label_immunization')!),
                        ],
                      ),
                      Row(
                        children: const [
                          _WeightGroup(label: '-3 SD', color: Colors.red),
                          _WeightGroup(label: '-2 SD', color: Colors.orange),
                          _WeightGroup(label: '-1 SD', color: Colors.amber),
                          _WeightGroup(label: 'Median', color: Colors.green),
                          _WeightGroup(label: '1 SD', color: Colors.amber),
                          _WeightGroup(label: '2 SD', color: Colors.orange),
                          _WeightGroup(label: '3 SD', color: Colors.red, opacity: 1.0),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _WeightGroup extends StatelessWidget {
  final String label;
  final Color color;
  final double opacity;
  const _WeightGroup({required this.label, required this.color, this.opacity = 0.2, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: color.withOpacity(opacity),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _LabelText extends StatelessWidget {
  final String label;
  const _LabelText(this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      color: Theme.of(context).primaryColor,
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}
