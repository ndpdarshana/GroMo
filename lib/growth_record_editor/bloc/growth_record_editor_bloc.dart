import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:growmo/growth_record_editor/height_scaler_field_widget.dart';
import 'package:growmo/growth_record_editor/weight_scaler_field_widget.dart';
import 'package:growmo/models/app_error.dart';

part 'growth_record_editor_event.dart';
part 'growth_record_editor_state.dart';

class GrowthRecordEditorBloc extends Bloc<GrowthRecordEditorEvent, GrowthRecordEditorState> {
  GrowthRecordEditorBloc() : super(GrowthRecordEditorState());

  @override
  Stream<GrowthRecordEditorState> mapEventToState(
    GrowthRecordEditorEvent event,
  ) async* {
    if (event is WeightSliderChanged) {
      yield _mapWeightScalerChangedToState(event);
    } else if (event is WeightFieldChanged) {
      yield _mapWeightFieldChangedToState(event);
    } else if (event is HeightSliderChanged) {
      yield _mapHeightSliderChangedToState(event);
    } else if (event is HeightFieldChanged) {
      yield _mapHeightFieldChangedToState(event);
    } else if (event is ASISwitchChanged) {
      yield _mapASISwitchChangedToState();
    } else if (event is BGMSwitchChanged) {
      yield _mapBGMSwitchChangedToState();
    } else if (event is PMTSwitchChanged) {
      yield _mapPMTSwitchChangedToState();
    } else if (event is VitaminASwitchChanged) {
      yield _mapVitaminASwitchChangedToState();
    } else if (event is T2SwitchChanged) {
      yield _mapT2SwitchChangedToState();
    } else if (event is ImmunizationSwitchChanged) {
      yield _mapImmunizationSwitchChangedToState();
    }
  }

  GrowthRecordEditorState _mapWeightScalerChangedToState(WeightSliderChanged event) {
    final weightInput = WeightInput.dirty(event.weight.toStringAsFixed(1), true);
    return state.copyWith(weightInput: weightInput, status: Formz.validate([weightInput, state.heightInput]));
  }

  GrowthRecordEditorState _mapWeightFieldChangedToState(WeightFieldChanged event) {
    final weightInput = WeightInput.dirty(event.weight);
    return state.copyWith(weightInput: weightInput, status: Formz.validate([weightInput, state.heightInput]));
  }

  GrowthRecordEditorState _mapHeightSliderChangedToState(HeightSliderChanged event) {
    final heightInput = HeightInput.dirty(event.height.toStringAsFixed(1), true);
    return state.copyWith(heightInput: heightInput, status: Formz.validate([heightInput, state.weightInput]));
  }

  GrowthRecordEditorState _mapHeightFieldChangedToState(HeightFieldChanged event) {
    final heightInput = HeightInput.dirty(event.height);
    return state.copyWith(heightInput: heightInput, status: Formz.validate([heightInput, state.weightInput]));
  }

  GrowthRecordEditorState _mapASISwitchChangedToState() {
    return state.copyWith(asi: !state.asi);
  }

  GrowthRecordEditorState _mapBGMSwitchChangedToState() {
    return state.copyWith(bgm: !state.bgm);
  }

  GrowthRecordEditorState _mapPMTSwitchChangedToState() {
    return state.copyWith(pmt: !state.pmt);
  }

  GrowthRecordEditorState _mapVitaminASwitchChangedToState() {
    return state.copyWith(vitaminA: !state.vitaminA);
  }

  GrowthRecordEditorState _mapT2SwitchChangedToState() {
    return state.copyWith(t2: !state.t2);
  }

  GrowthRecordEditorState _mapImmunizationSwitchChangedToState() {
    return state.copyWith(immunization: !state.immunization);
  }
}
