import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:growmo/models/growth_entry.dart';
import 'package:growmo/repositories/growth_record_repository.dart';

import '/models/app_error.dart';
import '/models/child.dart';

part 'child_details_event.dart';
part 'child_details_state.dart';

class ChildDetailsBloc extends Bloc<ChildDetailsEvent, ChildDetailsState> {
  final Child child;
  StreamSubscription? _growthRecordsSubscription;
  ChildDetailsBloc(this.child) : super(ChildDetailsState(child: child));

  @override
  Future<void> close() {
    _growthRecordsSubscription?.cancel();
    return super.close();
  }

  @override
  Stream<ChildDetailsState> mapEventToState(
    ChildDetailsEvent event,
  ) async* {
    if (event is LoadChildDetails) {
      yield* _mapLoadChildDetailsToState(event, state);
    } else if (event is NavigatedToOverviewPage) {
      yield _mapNavigatedToOverviewPageToState();
    } else if (event is NavigatedToRecordsPage) {
      yield* _mapNavigatedToRecordsPageToState();
    } else if (event is GrowthRecordsUpdated) {
      yield _mapGrowthRecordsUpdatedToState(event);
    }
  }

  Stream<ChildDetailsState> _mapLoadChildDetailsToState(LoadChildDetails event, ChildDetailsState state) async* {
    yield state.copyWith(status: ChildDetailsStateStatus.loading);

    yield state.copyWith(status: ChildDetailsStateStatus.pristin, page: ChildDetailPages.overview);
  }

  ChildDetailsState _mapNavigatedToOverviewPageToState() {
    return state.copyWith(page: ChildDetailPages.overview);
  }

  Stream<ChildDetailsState> _mapNavigatedToRecordsPageToState() async* {
    yield state.copyWith(status: ChildDetailsStateStatus.loading, page: ChildDetailPages.records);

    _growthRecordsSubscription?.cancel();
    _growthRecordsSubscription = GrowthRecordRepository()
        .getGrowthEntries(childId: state.child.id!)
        .listen((records) => add(GrowthRecordsUpdated(records)));
  }

  ChildDetailsState _mapGrowthRecordsUpdatedToState(GrowthRecordsUpdated event) {
    return state.copyWith(status: ChildDetailsStateStatus.pristin, records: event.records);
  }
}
