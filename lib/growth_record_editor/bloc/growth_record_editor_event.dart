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

class HeightSliderChanged extends GrowthRecordEditorEvent {
  final double height;

  const HeightSliderChanged(this.height);

  @override
  List<Object> get props => [height];
}

class HeightFieldChanged extends GrowthRecordEditorEvent {
  final String height;

  const HeightFieldChanged(this.height);

  @override
  List<Object> get props => [height];
}

class GrowthRecordSubmitted extends GrowthRecordEditorEvent {}
