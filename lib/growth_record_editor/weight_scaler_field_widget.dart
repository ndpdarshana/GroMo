import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:growmo/growth_record_editor/bloc/growth_record_editor_bloc.dart';
import '/app_localizations.dart';

enum WeightInputError { invalid }
const int MAX_WEIGHT = 3000;

class WeightInput extends FormzInput<int, WeightInputError> {
  const WeightInput.pure() : super.pure(0);
  const WeightInput.dirty(int value) : super.dirty(value);

  @override
  WeightInputError? validator(int value) {
    return value > 0 ? null : WeightInputError.invalid;
  }
}

class WeightScalerFieldWidget extends StatefulWidget {
  @override
  _WeightScalerFieldWidgetState createState() => _WeightScalerFieldWidgetState();
}

class _WeightScalerFieldWidgetState extends State<WeightScalerFieldWidget> {
  final TextEditingController _textFieldController = TextEditingController();
  double _slider = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.translate('field_label_weight')!,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          BlocListener<GrowthRecordEditorBloc, GrowthRecordEditorState>(
            listenWhen: (previous, current) => previous.weightInput != current.weightInput,
            listener: (context, state) {
              setState(() {
                // _textFieldController.text = state.weightInput.value.toString();
                _slider = state.weightInput.value.toDouble();
              });
            },
            child: Row(
              children: [
                Expanded(
                  child: Slider(
                    value: _slider,
                    min: 0,
                    max: MAX_WEIGHT.toDouble(),
                    onChanged: (value) => context.read<GrowthRecordEditorBloc>().add(WeightSliderChanged(value)),
                  ),
                ),
                Container(
                  width: 80,
                  child: TextFormField(
                    controller: _textFieldController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) => context.read<GrowthRecordEditorBloc>().add(WeightFieldChanged(value)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
