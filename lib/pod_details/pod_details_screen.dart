import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/models/pod.dart';
import '/pod_details/bloc/pod_details_bloc.dart';
import '/pod_details/pod_bottom_navigator.dart';
import '/pod_details/children_page.dart';
import '/pod_details/reports_page.dart';
import '/widgets/loading_indecator.dart';

class PodDetailsScreen extends StatelessWidget {
  static const String routeName = '/pods/pod_details';
  final Pod pod;

  PodDetailsScreen({@required this.pod}) : assert(pod != null);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PodDetailsBloc()..add(LoadPodDetails(pod: pod)),
      child: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
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
                          buildWhen: (previous, current) => previous.page != current.page,
                          builder: (_, state) {
                            if (state.page == PodDetailPages.reports) {
                              return ReportsPage();
                            } else {
                              return ChildrenPage();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  child: IconButton(
                    icon: BackButtonIcon(),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                BlocBuilder<PodDetailsBloc, PodDetailsState>(
                  buildWhen: (previous, current) => previous.status != current.status,
                  builder: (_, state) {
                    return LoadingIndecator(visible: state.status == PodDetailsStateStatus.loading);
                  },
                )
              ],
            ),
            bottomNavigationBar: PodBottomNavigator(),
          ),
        ),
      ),
    );
  }
}
