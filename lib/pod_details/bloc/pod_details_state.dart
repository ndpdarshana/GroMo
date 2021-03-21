part of 'pod_details_bloc.dart';

enum PodDetailsStateStatus { loading, pristine, failed, searching, filtered }
enum PodDetailPages { children, createChild, reports }

class PodDetailsState extends Equatable {
  final PodDetailsStateStatus status;
  final PodDetailPages page;
  final Pod pod;
  final List<Child> children;
  final List<Child> filteredChildren;
  final String searchTerm;
  final AppError error;

  const PodDetailsState(
      {this.status, this.page, this.pod, this.children, this.filteredChildren, this.searchTerm, this.error});

  @override
  List<Object> get props => [status, page, pod, children, filteredChildren, searchTerm, error];

  PodDetailsState copyWith(
      {PodDetailsStateStatus status,
      PodDetailPages page,
      Pod pod,
      List<Child> children,
      List<Child> filteredChildren,
      String searchTerm,
      AppError error}) {
    return PodDetailsState(
      status: status ?? this.status,
      page: page ?? this.page,
      pod: pod ?? this.pod,
      children: children ?? this.children,
      filteredChildren: filteredChildren ?? this.filteredChildren,
      searchTerm: searchTerm ?? this.searchTerm,
      error: error ?? this.error,
    );
  }
}
