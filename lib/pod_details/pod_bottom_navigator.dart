import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growMo/app_localizations.dart';
import 'package:growMo/child_record_editor/child_record_editor_screen.dart';
import 'package:growMo/pod_details/bloc/pod_details_bloc.dart';

class PodBottomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PodDetailsBloc, PodDetailsState>(
      builder: (_, state) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: AppLocalizations.of(context).translate('label_children')),
            BottomNavigationBarItem(
                icon: Icon(Icons.add), label: AppLocalizations.of(context).translate('label_create_new')),
            BottomNavigationBarItem(
                icon: Icon(Icons.article), label: AppLocalizations.of(context).translate('label_f1_form')),
          ],
          onTap: (index) async {
            switch (index) {
              case (0):
                context.read<PodDetailsBloc>().add(ChangeSelectedPage(page: PodDetailPages.children));
                break;
              case (1):
                final result =
                    await Navigator.of(context).pushNamed(ChildRecordEditorScreen.routeName, arguments: state.pod);

                if (result != null) {
                  Scaffold.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text(result)));
                }
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
