import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:growMo/app_localizations.dart';
import 'package:growMo/pods/bloc/pods_bloc.dart';

class PodsSearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextField(
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context).translate('field_label_search'),
          suffixIcon: Icon(Icons.search),
        ),
        onChanged: (term) => context.read<PodsBloc>().add(PodsSearchTextChanged(searchTerm: term)),
        textInputAction: TextInputAction.search,
      ),
    );
  }
}
