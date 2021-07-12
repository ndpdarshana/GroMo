part of 'growth_record_editor_bloc.dart';

abstract class GrowthRecordEditorEvent extends Equatable {
  const GrowthRecordEditorEvent();

  @override
  List<Object> get props => [];
}

class GrowthRecordSubmitted extends GrowthRecordEditorEvent {}
