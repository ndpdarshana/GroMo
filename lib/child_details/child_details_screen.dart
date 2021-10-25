import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/child_details/bloc/child_details_bloc.dart';
import '/child_details/child_bottom_navigator.dart';
import '/child_details/child_overview_page.dart';
import '/child_details/child_records_page.dart';
import '/models/child.dart';
import '/widgets/loading_indecator.dart';

class ChildDetailsSecreen extends StatelessWidget {
  static const routeName = '/pods/pod_details/child';

  final Child child;

  const ChildDetailsSecreen({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChildDetailsBloc(child)..add(LoadChildDetails()),
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
                        child: Text(
                          child.name!,
                          style: Theme.of(context).textTheme.headline6!.apply(color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BlocBuilder<ChildDetailsBloc, ChildDetailsState>(
                          buildWhen: (previous, current) => previous.page != current.page,
                          builder: (_, state) {
                            if (state.page == ChildDetailPages.overview) {
                              return const ChildOverviewPage();
                            } else {
                              return const ChildRecordsPage();
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                  child: IconButton(
                    icon: const BackButtonIcon(),
                    color: Colors.white,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                BlocBuilder<ChildDetailsBloc, ChildDetailsState>(
                  buildWhen: (previous, current) => previous.status != current.status,
                  builder: (_, state) {
                    return LoadingIndecator(visible: state.status == ChildDetailsStateStatus.loading);
                  },
                )
              ],
            ),
            bottomNavigationBar: const ChildBottomNavigator(),
          ),
        ),
      ),
    );
  }
}
