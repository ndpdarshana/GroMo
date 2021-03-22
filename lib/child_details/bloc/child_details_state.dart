part of 'child_details_bloc.dart';

enum ChildDetailsStateStatus { loading, pristin, failed }
enum ChildDetailPages { overview, newrecord, records }

class ChildDetailsState extends Equatable {
  final ChildDetailsStateStatus status;
  final ChildDetailPages page;
  final Child child;
  final AppError error;

  const ChildDetailsState({this.status, this.page, this.child, this.error});

  @override
  List<Object> get props => [status, page, child, error];

  ChildDetailsState copyWith({
    ChildDetailsStateStatus status,
    ChildDetailPages page,
    Child child,
    AppError error,
  }) {
    return ChildDetailsState(
      status: status ?? this.status,
      page: page ?? this.page,
      child: child ?? this.child,
      error: error ?? this.error,
    );
  }
}
