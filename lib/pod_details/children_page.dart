import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growMo/child_details/child_details_screen.dart';
import 'package:growMo/pod_details/bloc/pod_details_bloc.dart';
import 'package:growMo/pod_details/children_search_input.dart';
import 'package:intl/intl.dart';

class ChildrenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChildrenSearchInput(),
        Expanded(
          child: BlocConsumer<PodDetailsBloc, PodDetailsState>(
            listenWhen: (previous, current) => previous.status != current.status,
            listener: (context, state) {
              if (state.status == PodDetailsStateStatus.failed) {
                Scaffold.of(context).removeCurrentSnackBar();
                Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.error.message)));
              } else {
                Scaffold.of(context).removeCurrentSnackBar();
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
                          child: Text(state.filteredChildren[index].name[0]),
                        ),
                        title: Text(state.filteredChildren[index].name),
                        subtitle: Text(state.filteredChildren[index].dob != null
                            ? DateFormat.yMMMEd().format(state.filteredChildren[index].dob)
                            : '-'),
                        onTap: () => Navigator.of(context)
                            .pushNamed(ChildDetailsSecreen.routeName, arguments: state.filteredChildren[index]),
                      ),
                    );
                  },
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ],
    );
  }
}