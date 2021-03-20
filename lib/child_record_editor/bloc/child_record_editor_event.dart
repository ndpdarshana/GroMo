part of 'child_record_editor_bloc.dart';

abstract class ChildRecordEditorEvent extends Equatable {
  const ChildRecordEditorEvent();

  @override
  List<Object> get props => [];
}

class ChildNameFieldChanged extends ChildRecordEditorEvent {
  final String childName;

  const ChildNameFieldChanged(this.childName);

  @override
  List<Object> get props => [childName];
}

class ChildNicFieldChanged extends ChildRecordEditorEvent {
  final String childNic;

  const ChildNicFieldChanged(this.childNic);

  @override
  List<Object> get props => [childNic];
}

class ChildGenderRadioChanged extends ChildRecordEditorEvent {
  final Gender gender;

  const ChildGenderRadioChanged(this.gender);

  @override
  List<Object> get props => [gender];
}

class ChildDobChanged extends ChildRecordEditorEvent {
  final DateTime dob;

  const ChildDobChanged(this.dob);

  @override
  List<Object> get props => [dob];
}

class AddressFieldChanged extends ChildRecordEditorEvent {
  final String address;

  const AddressFieldChanged(this.address);

  @override
  List<Object> get props => [address];
}

class ParentNameFieldChanged extends ChildRecordEditorEvent {
  final String parentName;

  const ParentNameFieldChanged(this.parentName);

  @override
  List<Object> get props => [parentName];
}

class ParentNicFieldChanged extends ChildRecordEditorEvent {
  final String parentNic;

  const ParentNicFieldChanged(this.parentNic);

  @override
  List<Object> get props => [parentNic];
}

class ContactFieldChanged extends ChildRecordEditorEvent {
  final String contact;

  const ContactFieldChanged(this.contact);

  @override
  List<Object> get props => [contact];
}
