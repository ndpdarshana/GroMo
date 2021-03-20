import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growMo/child_record_editor/child_record_editor_screen.dart';
import 'package:growMo/pod_details/bloc/pod_details_bloc.dart';

class BottomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PodDetailsBloc, PodDetailsState>(
      builder: (_, state) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Children'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Create New'),
            BottomNavigationBarItem(icon: Icon(Icons.article), label: 'F1 Report'),
          ],
          onTap: (index) {
            switch (index) {
              case (0):
                context.read<PodDetailsBloc>().add(ChangeSelectedPage(page: PodDetailPages.children));
                break;
              case (1):
                Navigator.of(context).pushNamed(ChildRecordEditorScreen.routeName);
                break;
              case (2):
                context.read<PodDetailsBloc>().add(ChangeSelectedPage(page: PodDetailPages.reports));
                break;
            }
          },
          currentIndex: state.page == PodDetailPages.children ? 0 : 2,
        );
      },
    );
  }
}
