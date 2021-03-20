import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growMo/models/pod.dart';
import 'package:growMo/pod_details/bloc/pod_details_bloc.dart';
import 'package:growMo/pod_details/bottom_navigator.dart';
import 'package:growMo/pod_details/children_page.dart';
import 'package:growMo/pod_details/reports_page.dart';

class PodDetailsScreen extends StatelessWidget {
  static const String routeName = '/pods/pod_details';
  final Pod pod;

  PodDetailsScreen({@required this.pod}) : assert(pod != null);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PodDetailsBloc()..add(LoadPodDetails()),
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 180,
                    color: Theme.of(context).primaryColor,
                    child: Center(
                      child: Text(pod.code),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BlocBuilder<PodDetailsBloc, PodDetailsState>(
                          builder: (_, state) {
                            if (state.page == PodDetailPages.reports) {
                              return ReportsPage();
                            } else {
                              return ChildrenPage();
                            }
                          },
                        )),
                  ),
                ],
              ),
              Positioned(
                top: 20,
                child: IconButton(
                  icon: BackButtonIcon(),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigator(),
        ),
      ),
    );
  }
}
