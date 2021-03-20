import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:growMo/child_record_editor/datetime_field_dob.dart';
import 'package:growMo/child_record_editor/number_field_contact.dart';
import 'package:growMo/child_record_editor/text_field_address.dart';
import 'package:growMo/child_record_editor/text_field_child_name.dart';
import 'package:growMo/child_record_editor/text_field_child_nic.dart';
import 'package:growMo/child_record_editor/text_field_parent_name.dart';
import 'package:growMo/child_record_editor/text_field_parent_nic.dart';
import 'package:growMo/models/app_error.dart';

part 'child_record_editor_event.dart';
part 'child_record_editor_state.dart';

class ChildRecordEditorBloc extends Bloc<ChildRecordEditorEvent, ChildRecordEditorState> {
  ChildRecordEditorBloc() : super(ChildRecordEditorState(dobInput: DobInput.pure()));

  @override
  Stream<ChildRecordEditorState> mapEventToState(
    ChildRecordEditorEvent event,
  ) async* {
    if (event is ChildNameFieldChanged) {
      yield _mapChildNameFieldChangedToState(event, state);
    } else if (event is ChildNicFieldChanged) {
      yield _mapChildNicFieldChangedToState(event, state);
    } else if (event is ChildGenderRadioChanged) {
      yield _mapChildGenderRadioChangedToState(event, state);
    } else if (event is ChildDobChanged) {
      yield _mapChildDobChangedToState(event, state);
    } else if (event is AddressFieldChanged) {
      yield _mapAddressFieldChangedToState(event, state);
    } else if (event is ParentNameFieldChanged) {
      yield _mapParentNameFieldChangedToState(event, state);
    } else if (event is ParentNicFieldChanged) {
      yield _mapParentNicFieldChangedToState(event, state);
    } else if (event is ContactFieldChanged) {
      yield _mapContactFieldChangedToState(event, state);
    }
  }

  ChildRecordEditorState _mapChildNameFieldChangedToState(ChildNameFieldChanged event, ChildRecordEditorState state) {
    final childNameInput = ChildNameInput.dirty(event.childName);
    return state.copyWith(
      status: Formz.validate([
        childNameInput,
        state.childNicInput,
        state.dobInput,
        state.addressInput,
        state.parentNameInput,
        state.parentNicInput,
        state.contactInput,
      ]),
      childNameInput: childNameInput,
    );
  }

  ChildRecordEditorState _mapChildNicFieldChangedToState(ChildNicFieldChanged event, ChildRecordEditorState state) {
    final childNicInput = ChildNicInput.dirty(event.childNic);
    return state.copyWith(
      status: Formz.validate([
        childNicInput,
        state.childNameInput,
        state.dobInput,
        state.addressInput,
        state.parentNameInput,
        state.parentNicInput,
        state.contactInput,
      ]),
      childNicInput: childNicInput,
    );
  }

  ChildRecordEditorState _mapChildGenderRadioChangedToState(
      ChildGenderRadioChanged event, ChildRecordEditorState state) {
    return state.copyWith(gender: event.gender);
  }

  ChildRecordEditorState _mapChildDobChangedToState(ChildDobChanged event, ChildRecordEditorState state) {
    final dobInput = DobInput.dirty(event.dob);

    return state.copyWith(
      status: Formz.validate([
        dobInput,
        state.childNameInput,
        state.childNicInput,
        state.addressInput,
        state.parentNameInput,
        state.parentNicInput,
        state.contactInput,
      ]),
      dobInput: dobInput,
    );
  }

  ChildRecordEditorState _mapAddressFieldChangedToState(AddressFieldChanged event, ChildRecordEditorState state) {
    final addressInput = AddressInput.dirty(event.address);

    return state.copyWith(
      status: Formz.validate([
        addressInput,
        state.childNameInput,
        state.childNicInput,
        state.dobInput,
        state.parentNameInput,
        state.parentNicInput,
        state.contactInput,
      ]),
      addressInput: addressInput,
    );
  }

  ChildRecordEditorState _mapParentNameFieldChangedToState(ParentNameFieldChanged event, ChildRecordEditorState state) {
    final parentNameInput = ParentNameInput.dirty(event.parentName);
    return state.copyWith(
      status: Formz.validate([
        parentNameInput,
        state.childNameInput,
        state.childNicInput,
        state.dobInput,
        state.addressInput,
        state.parentNicInput,
        state.contactInput,
      ]),
      parentNameInput: parentNameInput,
    );
  }

  ChildRecordEditorState _mapParentNicFieldChangedToState(ParentNicFieldChanged event, ChildRecordEditorState state) {
    final parentNicInput = ParentNicInput.dirty(event.parentNic);

    return state.copyWith(
      status: Formz.validate([
        parentNicInput,
        state.childNameInput,
        state.childNicInput,
        state.dobInput,
        state.addressInput,
        state.parentNameInput,
        state.contactInput,
      ]),
      parentNicInput: parentNicInput,
    );
  }

  ChildRecordEditorState _mapContactFieldChangedToState(ContactFieldChanged event, ChildRecordEditorState state) {
    final contactInput = ContactInput.dirty(event.contact);
    return state.copyWith(
      status: Formz.validate([
        contactInput,
        state.childNameInput,
        state.childNicInput,
        state.dobInput,
        state.addressInput,
        state.parentNameInput,
        state.parentNicInput,
      ]),
      contactInput: contactInput,
    );
  }
}
