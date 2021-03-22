part of 'child_details_bloc.dart';

abstract class ChildDetailsEvent extends Equatable {
  const ChildDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadChildDetails extends ChildDetailsEvent {
  final Child child;

  const LoadChildDetails(this.child);

  @override
  List<Object> get props => [child];
}

class ChildDetailsChangeSelectedPage extends ChildDetailsEvent {
  final ChildDetailPages page;

  ChildDetailsChangeSelectedPage({@required this.page});

  @override
  List<Object> get props => [page];
}
