import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'growth_record_editor_event.dart';
part 'growth_record_editor_state.dart';

class GrowthRecordEditorBloc extends Bloc<GrowthRecordEditorEvent, GrowthRecordEditorState> {
  GrowthRecordEditorBloc() : super(GrowthRecordEditorState());

  @override
  Stream<GrowthRecordEditorState> mapEventToState(
    GrowthRecordEditorEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
