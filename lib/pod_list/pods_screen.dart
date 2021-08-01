import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growmo/auth/bloc/auth_bloc.dart';

import '/pod_list/bloc/pods_bloc.dart';
import '/pod_list/pod_list.dart';
import '/pod_list/pods_search_input.dart';
import '/widgets/loading_indecator.dart';

class PodsScreen extends StatelessWidget {
  static const String routeName = '/pods';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PodsBloc()..add(LoadPods()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pods List'),
          actions: [
            DropdownButton(
              icon: Icon(Icons.more_vert, color: Colors.white),
              items: [
                DropdownMenuItem(
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app, color: Theme.of(context).iconTheme.color),
                        SizedBox(width: 8),
                        Text('Loagout'),
                      ],
                    ),
                  ),
                  value: 'logout',
                )
              ],
              onChanged: (value) {
                if (value == 'logout') {
                  context.read<AuthBloc>().add(AuthSignoutRequest());
                }
              },
            )
          ],
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  PodsSearchInput(),
                  Expanded(child: PodList()),
                ],
              ),
            ),
            BlocBuilder<PodsBloc, PodsState>(
              buildWhen: (previous, current) => previous.status != current.status,
              builder: (context, state) => LoadingIndecator(
                visible: state.status == PodsStateStatus.loading || state.status == PodsStateStatus.searching,
              ),
            )
          ],
        ),
      ),
    );
  }
}
