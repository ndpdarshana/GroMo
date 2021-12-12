import 'package:flutter/material.dart';
import 'package:growmo/app_localizations.dart';
import 'package:growmo/models/growth_entry.dart';
import 'package:intl/intl.dart';

class GrowthRecordWidget extends StatelessWidget {
  final GrowthEntry record;
  final int monthsSinceBirth;

  const GrowthRecordWidget({required this.record, required this.monthsSinceBirth, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(record.timestamp!.toDate().day.toString()),
              Text(
                DateFormat('MMM').format(record.timestamp!.toDate()),
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${AppLocalizations.of(context)!.translate('field_label_weight')!}: ${record.weight}',
            ),
            Text(
              '${AppLocalizations.of(context)!.translate('field_label_height')!}: ${record.height}',
            ),
          ],
        ),
        subtitle: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (record.asi) _LabelText(AppLocalizations.of(context)!.translate('label_asi')!),
                if (record.bgm) _LabelText(AppLocalizations.of(context)!.translate('label_bgm')!),
                if (record.pmt) _LabelText(AppLocalizations.of(context)!.translate('label_pmt')!),
                if (record.vitaminA) _LabelText(AppLocalizations.of(context)!.translate('label_vitamin_a')!),
                if (record.immunization) _LabelText(AppLocalizations.of(context)!.translate('label_immunization')!),
              ],
            ),
            Row(
              children: [
                _WeightGroup(
                    label: '-3 SD', color: Colors.red, weight: record.weight, monthsSinceBirth: monthsSinceBirth),
                _WeightGroup(
                    label: '-2 SD', color: Colors.orange, weight: record.weight, monthsSinceBirth: monthsSinceBirth),
                _WeightGroup(
                    label: '-1 SD', color: Colors.amber, weight: record.weight, monthsSinceBirth: monthsSinceBirth),
                _WeightGroup(
                    label: 'Median', color: Colors.green, weight: record.weight, monthsSinceBirth: monthsSinceBirth),
                _WeightGroup(
                    label: '1 SD', color: Colors.amber, weight: record.weight, monthsSinceBirth: monthsSinceBirth),
                _WeightGroup(
                    label: '2 SD', color: Colors.orange, weight: record.weight, monthsSinceBirth: monthsSinceBirth),
                _WeightGroup(
                    label: '3 SD', color: Colors.red, weight: record.weight, monthsSinceBirth: monthsSinceBirth),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _WeightGroup extends StatelessWidget {
  final String label;
  final Color color;
  final double weight;
  final int monthsSinceBirth;
  const _WeightGroup(
      {required this.label, required this.color, required this.weight, required this.monthsSinceBirth, Key? key})
      : super(key: key);

  double get opacity {
    return 0.2;
  }

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
