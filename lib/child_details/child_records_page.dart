import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growmo/child_details/bloc/child_details_bloc.dart';
import 'package:growmo/child_details/child_growth_record_widget.dart';

class ChildRecordsPage extends StatelessWidget {
  const ChildRecordsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChildDetailsBloc, ChildDetailsState>(
      listener: (_, state) {
        if (state.status == ChildDetailsStateStatus.failed) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error?.message ?? 'Unknown Error')));
        } else {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
        }
      },
      builder: (_, state) {
        if (state.status == ChildDetailsStateStatus.pristin) {
          return ListView.builder(
            itemCount: state.records?.length ?? 0,
            shrinkWrap: true,
            itemBuilder: (_, index) =>
                GrowthRecordWidget(record: state.records![index], monthsSinceBirth: state.monthsSinceBirth),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
