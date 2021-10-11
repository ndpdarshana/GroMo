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
}
