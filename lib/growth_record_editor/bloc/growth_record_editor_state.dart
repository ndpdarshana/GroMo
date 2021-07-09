part of 'growth_record_editor_bloc.dart';

abstract class GrowthRecordEditorState extends Equatable {
  const GrowthRecordEditorState();
  
  @override
  List<Object> get props => [];
}

class GrowthRecordEditorInitial extends GrowthRecordEditorState {}
