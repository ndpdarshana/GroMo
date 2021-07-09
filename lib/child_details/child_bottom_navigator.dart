import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growMo/app_localizations.dart';
import 'package:growMo/child_details/bloc/child_details_bloc.dart';
import 'package:growMo/growth_record_editor/growth_record_editor_screen.dart';

class ChildBottomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildDetailsBloc, ChildDetailsState>(
      builder: (_, state) {
        return BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.pages), label: AppLocalizations.of(context).translate('label_overview')),
            BottomNavigationBarItem(
                icon: Icon(Icons.add), label: AppLocalizations.of(context).translate('label_create_new')),
            BottomNavigationBarItem(
                icon: Icon(Icons.article), label: AppLocalizations.of(context).translate('label_records'))
          ],
          onTap: (index) async {
            switch (index) {
              case (0):
                context.read<ChildDetailsBloc>().add(ChildDetailsChangeSelectedPage(page: ChildDetailPages.overview));
                break;
              case (1):
                final result =
                    await Navigator.of(context).pushNamed(GrowthRecordEditorScreen.routeName, arguments: state.child);

                if (result != null) {
                  Scaffold.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text(result)));
                }
                break;
              case (2):
                context.read<ChildDetailsBloc>().add(ChildDetailsChangeSelectedPage(page: ChildDetailPages.records));
                break;
            }
          },
          currentIndex: state.page == ChildDetailPages.overview ? 0 : 2,
        );
      },
    );
  }
}
