import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growMo/pod_list/bloc/pods_bloc.dart';
import 'package:intl/intl.dart';

class PodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PodsBloc, PodsState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (_, state) {
        if (state.status == PodsStateStatus.failed) {
          Scaffold.of(context).removeCurrentSnackBar();
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.error.message)));
        } else {
          Scaffold.of(context).removeCurrentSnackBar();
        }
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (_, state) {
        if (state.status == PodsStateStatus.loading) {
          return Center(child: Text('loading...'));
        } else if (state.status == PodsStateStatus.pristine || state.status == PodsStateStatus.filtered) {
          return ListView.builder(
            itemCount: state.filteredPods.length,
            itemBuilder: (_, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(state.filteredPods[index].code),
                  ),
                  title: Text(state.filteredPods[index].name),
                  subtitle: Text(state.filteredPods[index].lastUpdate != null
                      ? DateFormat.yMMMEd().format(state.filteredPods[index].lastUpdate)
                      : '-'),
                  onTap: () => print(state.filteredPods[index].id),
                ),
              );
            },
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
