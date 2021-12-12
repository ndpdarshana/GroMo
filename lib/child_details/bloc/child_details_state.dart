part of 'child_details_bloc.dart';

enum ChildDetailsStateStatus { loading, pristin, failed }
enum ChildDetailPages { overview, newrecord, records }

class ChildDetailsState extends Equatable {
  final Child child;
  final ChildDetailsStateStatus? status;
  final ChildDetailPages? page;
  final List<GrowthEntry>? records;
  final AppError? error;

  const ChildDetailsState({required this.child, this.status, this.page, this.records, this.error});

  int get monthsSinceBirth {
    DateTime today = DateTime.now();
    DateTime dob = child.dob;
    final diffInMonths = today.difference(dob).inDays ~/ 30;
    return diffInMonths;
  }

  @override
  List<Object?> get props => [status, page, records, child, error];

  ChildDetailsState copyWith({
    ChildDetailsStateStatus? status,
    ChildDetailPages? page,
    List<GrowthEntry>? records,
    AppError? error,
  }) {
    return ChildDetailsState(
      status: status ?? this.status,
      page: page ?? this.page,
      records: records ?? this.records,
      child: child,
      error: error ?? this.error,
    );
  }
}
