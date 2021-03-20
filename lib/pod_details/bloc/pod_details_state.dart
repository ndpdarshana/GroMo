part of 'pod_details_bloc.dart';

enum PodDetailsStateStatus { loading, pristine, failed }
enum PodDetailPages { children, createChild, reports }

class PodDetailsState extends Equatable {
  final PodDetailsStateStatus status;
  final PodDetailPages page;
  final Pod pod;
  final List<Child> children;
  final AppError error;

  const PodDetailsState({this.status, this.page, this.pod, this.children, this.error});

  @override
  List<Object> get props => [status, page, pod, children, error];

  PodDetailsState copyWith(
      {final PodDetailsStateStatus status,
      final PodDetailPages page,
      final Pod pod,
      final List<Child> children,
      final AppError error}) {
    return PodDetailsState(
      status: status ?? this.status,
      page: page ?? this.page,
      pod: pod ?? this.pod,
      children: children ?? this.children,
      error: error ?? this.error,
    );
  }
}
