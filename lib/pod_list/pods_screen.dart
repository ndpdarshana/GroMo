import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growMo/app/bloc/app_bloc.dart';
import 'package:growMo/pod_list/bloc/pods_bloc.dart';
import 'package:growMo/pod_list/pod_list.dart';
import 'package:growMo/pod_list/pods_search_input.dart';
import 'package:growMo/widgets/loading_indecator.dart';

class PodsScreen extends StatelessWidget {
  static const String routeName = '/pods';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PodsBloc()..add(LoadPods()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pods List'),
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
