import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growMo/models/pod.dart';
import 'package:growMo/pods/bloc/pods_bloc.dart';
import 'package:growMo/pods/pod_list.dart';
import 'package:growMo/pods/pods_search_input.dart';
import 'package:intl/intl.dart';

class PodsScreen extends StatelessWidget {
  static const String routeName = '/podlist';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PodsBloc()..add(LoadPods()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pods List'),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              PodsSearchInput(),
              Expanded(child: PodList()),
            ],
          ),
        ),
      ),
    );
  }
}
