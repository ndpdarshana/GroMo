import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '/child_details/child_details_screen.dart';
import '/pod_details/bloc/pod_details_bloc.dart';
import '/pod_details/children_search_input.dart';

class ChildrenPage extends StatelessWidget {
  const ChildrenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ChildrenSearchInput(),
        Expanded(
          child: BlocConsumer<PodDetailsBloc, PodDetailsState>(
            listenWhen: (previous, current) => previous.status != current.status,
            listener: (context, state) {
              if (state.status == PodDetailsStateStatus.failed) {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error?.message ?? 'Unknown Error')));
              } else {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
              }
            },
            builder: (_, state) {
              if (state.status == PodDetailsStateStatus.pristine || state.status == PodDetailsStateStatus.filtered) {
                return ListView.builder(
                  itemCount: state.filteredChildren?.length ?? 0,
                  itemBuilder: (_, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(state.filteredChildren![index].name[0]),
                        ),
                        title: Text(state.filteredChildren![index].name),
                        subtitle: Text(DateFormat.yMMMEd().format(state.filteredChildren![index].dob)),
                        onTap: () => Navigator.of(context)
                            .pushNamed(ChildDetailsSecreen.routeName, arguments: state.filteredChildren![index]),
                      ),
                    );
                  },
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ],
    );
  }
}
