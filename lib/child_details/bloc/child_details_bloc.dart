import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:growMo/models/app_error.dart';
import 'package:growMo/models/child.dart';

part 'child_details_event.dart';
part 'child_details_state.dart';

class ChildDetailsBloc extends Bloc<ChildDetailsEvent, ChildDetailsState> {
  ChildDetailsBloc() : super(ChildDetailsState());

  @override
  Stream<ChildDetailsState> mapEventToState(
    ChildDetailsEvent event,
  ) async* {
    if (event is LoadChildDetails) {
      yield* _mapLoadChildDetailsToState(event, state);
    } else if (event is ChildDetailsChangeSelectedPage) {
      yield _mapChildDetailsChangeSelectedPageToState(event, state);
    }
  }

  Stream<ChildDetailsState> _mapLoadChildDetailsToState(LoadChildDetails event, ChildDetailsState state) async* {
    yield state.copyWith(status: ChildDetailsStateStatus.loading);

    yield state.copyWith(status: ChildDetailsStateStatus.pristin, child: event.child, page: ChildDetailPages.overview);
  }

  ChildDetailsState _mapChildDetailsChangeSelectedPageToState(
      ChildDetailsChangeSelectedPage event, ChildDetailsState state) {
    return state.copyWith(page: event.page);
  }
}
