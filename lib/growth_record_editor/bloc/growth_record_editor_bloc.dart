import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:growmo/repositories/growth_record_repository.dart';
import 'package:growmo/growth_record_editor/height_scaler_field_widget.dart';
import 'package:growmo/growth_record_editor/weight_scaler_field_widget.dart';
import 'package:growmo/models/app_error.dart';
import 'package:growmo/models/growth_entry.dart';

part 'growth_record_editor_event.dart';
part 'growth_record_editor_state.dart';

class GrowthRecordEditorBloc extends Bloc<GrowthRecordEditorEvent, GrowthRecordEditorState> {
  GrowthRecordEditorBloc(String childId) : super(GrowthRecordEditorState(childId: childId));

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
    } else if (event is GrowthRecordSubmitted) {
      yield* _mapGrowthRecordSubmittedToState();
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

  Stream<GrowthRecordEditorState> _mapGrowthRecordSubmittedToState() async* {
    if (state.status == FormzStatus.valid) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);

      var entry = GrowthEntry(
        weight: double.tryParse(state.weightInput.value) ?? 0.0,
        height: double.tryParse(state.heightInput.value) ?? 0.0,
        asi: state.asi,
        bgm: state.bgm,
        pmt: state.pmt,
        vitaminA: state.vitaminA,
        t2: state.t2,
        immunization: state.immunization,
      );

      final result = await GrowthRecordRepository().createGrowthRecord(state.childId, entry);
      if (result.singleEntry != null) {
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      } else {
        yield state.copyWith(status: FormzStatus.submissionFailure, error: result.error);
      }
    }
  }
}
