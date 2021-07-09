import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growMo/child_details/bloc/child_details_bloc.dart';
import 'package:growMo/child_details/child_bottom_navigator.dart';
import 'package:growMo/child_details/child_overview_page.dart';
import 'package:growMo/child_details/child_records_page.dart';
import 'package:growMo/models/child.dart';
import 'package:growMo/widgets/loading_indecator.dart';

class ChildDetailsSecreen extends StatelessWidget {
  static const routeName = '/pods/pod_details/child';

  final Child child;

  const ChildDetailsSecreen({@required this.child}) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChildDetailsBloc()..add(LoadChildDetails(child)),
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
                      child: Text(child.name),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BlocBuilder<ChildDetailsBloc, ChildDetailsState>(
                        buildWhen: (previous, current) => previous.page != current.page,
                        builder: (_, state) {
                          if (state.page == ChildDetailPages.overview) {
                            return ChildOverviewPage();
                          } else {
                            return ChildRecordsPage();
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                top: 20,
                child: IconButton(
                  icon: BackButtonIcon(),
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
          bottomNavigationBar: ChildBottomNavigator(),
        ),
      ),
    );
  }
}