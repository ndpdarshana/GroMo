part of 'pods_bloc.dart';

abstract class PodsEvent extends Equatable {
  const PodsEvent();

  @override
  List<Object> get props => [];
}

class LoadPods extends PodsEvent {
  const LoadPods();

  @override
  List<Object> get props => [];
}

class PodsSearchTextChanged extends PodsEvent {
  final String searchTerm;

  const PodsSearchTextChanged({this.searchTerm});

  @override
  List<Object> get props => [searchTerm];
}
