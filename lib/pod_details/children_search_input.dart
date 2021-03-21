import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growMo/app_localizations.dart';
import 'package:growMo/pod_details/bloc/pod_details_bloc.dart';

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
