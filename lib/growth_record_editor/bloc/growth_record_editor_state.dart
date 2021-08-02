part of 'growth_record_editor_bloc.dart';

class GrowthRecordEditorState extends Equatable {
  final FormzStatus status;
  final WeightInput weightInput;
  final AppError? error;

  const GrowthRecordEditorState({
    this.status = FormzStatus.pure,
    this.weightInput = const WeightInput.pure(),
    this.error,
  });

  @override
  List<Object?> get props => [status, weightInput, error];

  GrowthRecordEditorState copyWith({
    FormzStatus? status,
    WeightInput? weightInput,
    AppError? error,
  }) =>
      GrowthRecordEditorState(
        status: status ?? this.status,
        weightInput: weightInput ?? this.weightInput,
        error: error ?? this.error,
      );
}
