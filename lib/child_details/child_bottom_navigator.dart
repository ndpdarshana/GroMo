import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/app_localizations.dart';
import '/child_details/bloc/child_details_bloc.dart';
import '/growth_record_editor/growth_record_editor_screen.dart';

class ChildBottomNavigator extends StatelessWidget {
  const ChildBottomNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildDetailsBloc, ChildDetailsState>(
      builder: (_, state) {
        return BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.pages), label: AppLocalizations.of(context)!.translate('label_overview')),
            BottomNavigationBarItem(
                icon: const Icon(Icons.add), label: AppLocalizations.of(context)!.translate('label_create_new')),
            BottomNavigationBarItem(
                icon: const Icon(Icons.article), label: AppLocalizations.of(context)!.translate('label_records'))
          ],
          onTap: (index) async {
            switch (index) {
              case (0):
                context.read<ChildDetailsBloc>().add(NavigatedToOverviewPage());
                break;
              case (1):
                final result =
                    await Navigator.of(context).pushNamed(GrowthRecordEditorScreen.routeName, arguments: state.child);

                if (result != null) {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result as String)));
                }
                break;
              case (2):
                context.read<ChildDetailsBloc>().add(NavigatedToRecordsPage());
                break;
            }
          },
          currentIndex: state.page == ChildDetailPages.overview ? 0 : 2,
        );
      },
    );
  }
}
