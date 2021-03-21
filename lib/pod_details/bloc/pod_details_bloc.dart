import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:growMo/models/app_error.dart';
import 'package:growMo/models/child.dart';
import 'package:growMo/models/pod.dart';

part 'pod_details_event.dart';
part 'pod_details_state.dart';

class PodDetailsBloc extends Bloc<PodDetailsEvent, PodDetailsState> {
  PodDetailsBloc() : super(PodDetailsState());

  @override
  Stream<PodDetailsState> mapEventToState(
    PodDetailsEvent event,
  ) async* {
    if (event is LoadPodDetails) {
      yield* _mapLoadPodDetailsToState(event, state);
    } else if (event is ChangeSelectedPage) {
      yield _mapChangeSelectedPageToState(event, state);
    }
  }

  Stream<PodDetailsState> _mapLoadPodDetailsToState(LoadPodDetails event, PodDetailsState state) async* {
    // yield state.copyWith(status: PodDetailsStateStatus.loading);

    yield state.copyWith(status: PodDetailsStateStatus.pristine, pod: event.pod, page: PodDetailPages.children);
  }

  PodDetailsState _mapChangeSelectedPageToState(ChangeSelectedPage event, PodDetailsState state) {
    return state.copyWith(page: event.page);
  }
}
