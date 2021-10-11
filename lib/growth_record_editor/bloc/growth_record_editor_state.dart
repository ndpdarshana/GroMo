part of 'growth_record_editor_bloc.dart';

class GrowthRecordEditorState extends Equatable {
  final FormzStatus status;
  final WeightInput weightInput;
  final HeightInput heightInput;
  final AppError? error;

  const GrowthRecordEditorState({
    this.status = FormzStatus.pure,
    this.weightInput = const WeightInput.pure(),
    this.heightInput = const HeightInput.pure(),
    this.error,
  });

  @override
  List<Object?> get props => [status, weightInput, heightInput, error];

  GrowthRecordEditorState copyWith({
    FormzStatus? status,
    WeightInput? weightInput,
    HeightInput? heightInput,
    AppError? error,
  }) =>
      GrowthRecordEditorState(
        status: status ?? this.status,
        weightInput: weightInput ?? this.weightInput,
        heightInput: heightInput ?? this.heightInput,
        error: error,
      );
}
