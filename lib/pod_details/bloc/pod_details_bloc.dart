import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/child_record_editor/child_record_repository.dart';
import '/models/app_error.dart';
import '/models/child.dart';
import '/models/pod.dart';

part 'pod_details_event.dart';
part 'pod_details_state.dart';

class PodDetailsBloc extends Bloc<PodDetailsEvent, PodDetailsState> {
  StreamSubscription? _childrenSubscription;
  PodDetailsBloc() : super(PodDetailsState());

  @override
  Future<void> close() {
    _childrenSubscription!.cancel();
    return super.close();
  }

  @override
  Stream<PodDetailsState> mapEventToState(
    PodDetailsEvent event,
  ) async* {
    if (event is LoadPodDetails) {
      yield* _mapLoadPodDetailsToState(event, state);
    } else if (event is PodChildrenUpdated) {
      yield* _mapPodChildrenUpdatedToState(event, state);
    } else if (event is ChangeSelectedPage) {
      yield _mapChangeSelectedPageToState(event, state);
    } else if (event is ChildrenSerachTextChanged) {
      yield* _mapChildrenSerachTextChangedToState(event, state);
    } else if (event is ChildrenFilterBySerachText) {
      yield _mapChildrenFilterBySerachTextToState(state);
    }
  }

  Stream<PodDetailsState> _mapLoadPodDetailsToState(LoadPodDetails event, PodDetailsState state) async* {
    yield state.copyWith(status: PodDetailsStateStatus.loading, pod: event.pod, page: PodDetailPages.children);

    _childrenSubscription?.cancel();
    _childrenSubscription = ChildrenRecordRepository()
        .getChildrenList(podId: event.pod.id!)
        .listen((children) => add(PodChildrenUpdated(children: children)));
  }

  Stream<PodDetailsState> _mapPodChildrenUpdatedToState(PodChildrenUpdated event, PodDetailsState state) async* {
    if (state.status == PodDetailsStateStatus.filtered) {
      yield state.copyWith(children: event.children);
      add(ChildrenFilterBySerachText());
    } else {
      yield state.copyWith(
          status: PodDetailsStateStatus.pristine, children: event.children, filteredChildren: event.children);
    }
  }

  PodDetailsState _mapChangeSelectedPageToState(ChangeSelectedPage event, PodDetailsState state) {
    return state.copyWith(page: event.page);
  }

  Stream<PodDetailsState> _mapChildrenSerachTextChangedToState(
      ChildrenSerachTextChanged event, PodDetailsState state) async* {
    yield state.copyWith(status: PodDetailsStateStatus.searching, searchTerm: event.searchTerm);
    add(ChildrenFilterBySerachText());
  }

  PodDetailsState _mapChildrenFilterBySerachTextToState(PodDetailsState state) {
    final filtered =
        state.children!.where((child) => child.name!.toLowerCase().contains(state.searchTerm!.toLowerCase())).toList();
    return state.copyWith(status: PodDetailsStateStatus.filtered, filteredChildren: filtered);
  }
}
