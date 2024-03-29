part of 'pod_details_bloc.dart';

abstract class PodDetailsEvent extends Equatable {
  const PodDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadPodDetails extends PodDetailsEvent {
  const LoadPodDetails();

  @override
  List<Object> get props => [];
}

class ChangeSelectedPage extends PodDetailsEvent {
  final PodDetailPages page;

  const ChangeSelectedPage({@required this.page}) : assert(page != null);

  @override
  List<Object> get props => [page];
}
