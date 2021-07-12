part of 'growth_record_editor_bloc.dart';

class GrowthRecordEditorState extends Equatable {
  final FormzStatus status;

  const GrowthRecordEditorState({
    this.status = FormzStatus.pure,
  });

  @override
  List<Object> get props => [status];
}
