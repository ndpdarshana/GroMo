part of 'growth_record_editor_bloc.dart';

abstract class GrowthRecordEditorEvent extends Equatable {
  const GrowthRecordEditorEvent();

  @override
  List<Object> get props => [];
}

class WeightSliderChanged extends GrowthRecordEditorEvent {
  final double weight;

  const WeightSliderChanged(this.weight);

  @override
  List<Object> get props => [weight];
}

class WeightFieldChanged extends GrowthRecordEditorEvent {
  final String weight;

  const WeightFieldChanged(this.weight);

  @override
  List<Object> get props => [weight];
}

class GrowthRecordSubmitted extends GrowthRecordEditorEvent {}
