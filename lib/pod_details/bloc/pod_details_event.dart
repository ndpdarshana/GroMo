part of 'pod_details_bloc.dart';

abstract class PodDetailsEvent extends Equatable {
  const PodDetailsEvent();

  @override
  List<Object?> get props => [];
}

class LoadPodDetails extends PodDetailsEvent {
  final Pod pod;

  const LoadPodDetails({required this.pod});

  @override
  List<Object> get props => [pod];
}

class PodChildrenUpdated extends PodDetailsEvent {
  final List<Child>? children;

  const PodChildrenUpdated({this.children});

  @override
  List<Object?> get props => [children];
}

class ChangeSelectedPage extends PodDetailsEvent {
  final PodDetailPages page;

  const ChangeSelectedPage({required this.page});

  @override
  List<Object> get props => [page];
}

class ChildrenSerachTextChanged extends PodDetailsEvent {
  final String? searchTerm;

  const ChildrenSerachTextChanged({this.searchTerm});

  @override
  List<Object?> get props => [searchTerm];
}

class ChildrenFilterBySerachText extends PodDetailsEvent {
  const ChildrenFilterBySerachText();

  @override
  List<Object> get props => [];
}
