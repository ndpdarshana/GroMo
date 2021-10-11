part of 'growth_record_editor_bloc.dart';

class GrowthRecordEditorState extends Equatable {
  final FormzStatus status;
  final WeightInput weightInput;
  final HeightInput heightInput;
  final bool asi;
  final bool bgm;
  final bool pmt;
  final bool vitaminA;
  final bool t2;
  final bool immunization;
  final AppError? error;

  const GrowthRecordEditorState({
    this.status = FormzStatus.pure,
    this.weightInput = const WeightInput.pure(),
    this.heightInput = const HeightInput.pure(),
    this.asi = false,
    this.bgm = false,
    this.pmt = false,
    this.vitaminA = false,
    this.t2 = false,
    this.immunization = false,
    this.error,
  });

  @override
  List<Object?> get props => [status, weightInput, heightInput, asi, bgm, pmt, vitaminA, t2, immunization, error];

  GrowthRecordEditorState copyWith({
    FormzStatus? status,
    WeightInput? weightInput,
    HeightInput? heightInput,
    bool? asi,
    bool? bgm,
    bool? pmt,
    bool? vitaminA,
    bool? t2,
    bool? immunization,
    AppError? error,
  }) =>
      GrowthRecordEditorState(
        status: status ?? this.status,
        weightInput: weightInput ?? this.weightInput,
        heightInput: heightInput ?? this.heightInput,
        asi: asi ?? this.asi,
        bgm: bgm ?? this.bgm,
        pmt: pmt ?? this.pmt,
        vitaminA: vitaminA ?? this.vitaminA,
        t2: t2 ?? this.t2,
        immunization: immunization ?? this.immunization,
        error: error,
      );
}
