import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/app_localizations.dart';
import '/pod_details/bloc/pod_details_bloc.dart';

class ChildrenSearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextField(
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context).translate('field_label_search'),
          suffixIcon: Icon(Icons.search),
        ),
        onChanged: (term) => context.read<PodDetailsBloc>().add(ChildrenSerachTextChanged(searchTerm: term)),
        textInputAction: TextInputAction.search,
      ),
    );
  }
}
