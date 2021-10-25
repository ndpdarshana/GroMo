part of 'child_details_bloc.dart';

abstract class ChildDetailsEvent extends Equatable {
  const ChildDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadChildDetails extends ChildDetailsEvent {}

class NavigatedToOverviewPage extends ChildDetailsEvent {}

class NavigatedToRecordsPage extends ChildDetailsEvent {}

class GrowthRecordsUpdated extends ChildDetailsEvent {
  final List<GrowthEntry> records;

  const GrowthRecordsUpdated(this.records);

  @override
  List<Object> get props => [records];
}
