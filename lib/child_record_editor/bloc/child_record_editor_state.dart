part of 'child_record_editor_bloc.dart';

enum Gender { male, female }

class ChildRecordEditorState extends Equatable {
  final FormzStatus status;
  final ChildNameInput childNameInput;
  final ChildNicInput childNicInput;
  final Gender gender;
  final DobInput dobInput;
  final AddressInput addressInput;
  final ParentNameInput parentNameInput;
  final ParentNicInput parentNicInput;
  final ContactInput contactInput;
  final AppError? error;

  const ChildRecordEditorState({
    this.status = FormzStatus.pure,
    this.childNameInput = const ChildNameInput.pure(),
    this.childNicInput = const ChildNicInput.pure(),
    this.gender = Gender.male,
    this.dobInput = const DobInput.pure(),
    this.addressInput = const AddressInput.pure(),
    this.parentNameInput = const ParentNameInput.pure(),
    this.parentNicInput = const ParentNicInput.pure(),
    this.contactInput = const ContactInput.pure(),
    this.error,
  });

  @override
  List<Object?> get props => [
        status,
        childNameInput,
        childNicInput,
        gender,
        dobInput,
        addressInput,
        parentNameInput,
        parentNicInput,
        contactInput,
        error
      ];

  ChildRecordEditorState copyWith({
    FormzStatus? status,
    ChildNameInput? childNameInput,
    ChildNicInput? childNicInput,
    Gender? gender,
    DobInput? dobInput,
    AddressInput? addressInput,
    ParentNameInput? parentNameInput,
    ParentNicInput? parentNicInput,
    ContactInput? contactInput,
    AppError? error,
  }) {
    return ChildRecordEditorState(
      status: status ?? this.status,
      childNameInput: childNameInput ?? this.childNameInput,
      childNicInput: childNicInput ?? this.childNicInput,
      gender: gender ?? this.gender,
      dobInput: dobInput ?? this.dobInput,
      addressInput: addressInput ?? this.addressInput,
      parentNameInput: parentNameInput ?? this.parentNameInput,
      parentNicInput: parentNicInput ?? this.parentNicInput,
      contactInput: contactInput ?? this.contactInput,
      error: error ?? this.error,
    );
  }
}
