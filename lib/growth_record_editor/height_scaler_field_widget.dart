import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:growmo/growth_record_editor/bloc/growth_record_editor_bloc.dart';
import '/app_localizations.dart';

enum HeightInputError { invalid }
const double MAX_HEIGHT = 100.0;

class HeightInput extends FormzInput<String, HeightInputError> {
  final bool isSlider;

  const HeightInput.pure()
      : isSlider = false,
        super.pure('');
  const HeightInput.dirty(String value, [bool isSlider = false])
      : isSlider = isSlider,
        super.dirty(value);

  @override
  HeightInputError? validator(String value) {
    return value.isNotEmpty ? null : HeightInputError.invalid;
  }
}

class HeightScalerFieldWidget extends StatefulWidget {
  @override
  _HeightScalerFieldWidgetState createState() => _HeightScalerFieldWidgetState();
}

class _HeightScalerFieldWidgetState extends State<HeightScalerFieldWidget> {
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
            AppLocalizations.of(context)!.translate('field_label_height')!,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          BlocListener<GrowthRecordEditorBloc, GrowthRecordEditorState>(
            listenWhen: (previous, current) => previous.heightInput != current.heightInput,
            listener: (context, state) {
              setState(() {
                if (state.heightInput.isSlider) {
                  _textFieldController.text = state.heightInput.value.toString();
                }
                _slider = double.tryParse(state.heightInput.value) ?? 0.0;
                if (_slider > MAX_HEIGHT) {
                  _slider = MAX_HEIGHT;
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
                    max: MAX_HEIGHT,
                    onChanged: (value) => context.read<GrowthRecordEditorBloc>().add(HeightSliderChanged(value)),
                  ),
                ),
                Container(
                  width: 80,
                  child: TextFormField(
                    controller: _textFieldController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    textInputAction: TextInputAction.next,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,1}'))],
                    onChanged: (value) => context.read<GrowthRecordEditorBloc>().add(HeightFieldChanged(value)),
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
