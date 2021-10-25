import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:growmo/growth_record_editor/bloc/growth_record_editor_bloc.dart';

import '/app_localizations.dart';

enum WeightInputError { invalid }
const double maxWeight = 20.0;

class WeightInput extends FormzInput<String, WeightInputError> {
  final bool isSlider;

  const WeightInput.pure()
      : isSlider = false,
        super.pure('');
  const WeightInput.dirty(String value, {this.isSlider = false}) : super.dirty(value);

  @override
  WeightInputError? validator(String value) {
    return value.isNotEmpty ? null : WeightInputError.invalid;
  }
}

class WeightScalerFieldWidget extends StatefulWidget {
  const WeightScalerFieldWidget({Key? key}) : super(key: key);

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
                if (state.weightInput.isSlider) {
                  _textFieldController.text = state.weightInput.value.toString();
                }
                _slider = double.tryParse(state.weightInput.value) ?? 0.0;
                if (_slider > maxWeight) {
                  _slider = maxWeight;
                } else if (_slider < 0) {
                  _slider = 0.0;
                }
              });
            },
            child: Row(
              children: [
                Expanded(
                  child: Slider(
                    value: _slider,
                    min: 0,
                    max: maxWeight,
                    onChanged: (value) => context.read<GrowthRecordEditorBloc>().add(WeightSliderChanged(value)),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: TextFormField(
                    controller: _textFieldController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    textInputAction: TextInputAction.next,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,1}'))],
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
