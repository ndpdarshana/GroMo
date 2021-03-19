part of 'pods_bloc.dart';

enum PodsStateStatus { loading, pristine, failed, searching, filtered }

class PodsState extends Equatable {
  final PodsStateStatus status;
  final List<Pod> pods;
  final List<Pod> filteredPods;
  final AppError error;

  const PodsState({this.status, this.pods, this.filteredPods, this.error});

  @override
  List<Object> get props => [status, pods, filteredPods, error];

  PodsState copyWith({PodsStateStatus status, List<Pod> pods, List<Pod> filteredPods, AppError error}) {
    return PodsState(
      status: status ?? this.status,
      pods: pods ?? this.pods,
      filteredPods: filteredPods ?? this.filteredPods,
      error: error ?? this.error,
    );
  }
}
