import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/models/app_error.dart';
import '/models/pod.dart';
import '/pod_list/pods_repository.dart';

part 'pods_event.dart';
part 'pods_state.dart';

class PodsBloc extends Bloc<PodsEvent, PodsState> {
  PodsBloc() : super(PodsState());

  @override
  Stream<PodsState> mapEventToState(
    PodsEvent event,
  ) async* {
    if (event is LoadPods) {
      yield* _mapLoadPodsToState(state);
    } else if (event is PodsSearchTextChanged) {
      yield* _mapPodsSearchTextChangedToState(event, state);
    }
  }

  Stream<PodsState> _mapLoadPodsToState(PodsState state) async* {
    yield state.copyWith(status: PodsStateStatus.loading);

    PodsRepositoryResult result = await PodsRepository().getPodList();

    if (result.pods != null) {
      yield state.copyWith(status: PodsStateStatus.pristine, pods: result.pods, filteredPods: result.pods);
    } else {
      yield state.copyWith(status: PodsStateStatus.failed, error: result.error);
    }
  }

  Stream<PodsState> _mapPodsSearchTextChangedToState(PodsSearchTextChanged event, PodsState state) async* {
    yield state.copyWith(status: PodsStateStatus.searching);
    final filteredPods = state.pods
        .where((pod) =>
            (pod.code.toLowerCase().contains(event.searchTerm.toLowerCase())) ||
            (pod.name.toLowerCase().contains(event.searchTerm.toLowerCase())))
        .toList();

    yield state.copyWith(status: PodsStateStatus.filtered, filteredPods: filteredPods);
  }
}
