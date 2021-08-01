import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '/pod_details/pod_details_screen.dart';
import '/pod_list/bloc/pods_bloc.dart';

class PodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PodsBloc, PodsState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (_, state) {
        if (state.status == PodsStateStatus.failed) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error!.message)));
        } else {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
        }
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (_, state) {
        if (state.status == PodsStateStatus.pristine || state.status == PodsStateStatus.filtered) {
          return ListView.builder(
            itemCount: state.filteredPods!.length,
            itemBuilder: (_, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(state.filteredPods![index].code!),
                  ),
                  title: Text(state.filteredPods![index].name!),
                  subtitle: Text(state.filteredPods![index].lastUpdate != null
                      ? DateFormat.yMMMEd().format(state.filteredPods![index].lastUpdate!)
                      : '-'),
                  onTap: () => Navigator.of(context)
                      .pushNamed(PodDetailsScreen.routeName, arguments: state.filteredPods![index]),
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
