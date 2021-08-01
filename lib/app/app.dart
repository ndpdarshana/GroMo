import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '/app/bloc/app_bloc.dart';
import '/app_localizations.dart';
import '/app_theme_data.dart';
import '/auth/bloc/auth_bloc.dart';
import '/login/login_screen.dart';
import '/pod_list/pods_screen.dart';
import '/routes.dart';

class App extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState? get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GrowMo',
      //List all the supported localizations
      supportedLocales: [
        Locale('en', 'US'),
        Locale('id', 'ID'),
      ],
      // These delagates make sure that the localization data for the proper language is loaded
      localizationsDelegates: [
        // A class which loads the translations from json files
        AppLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // if the locale of the device is not supported, use the first one
        // from the list (English, in this case)
        return supportedLocales.first;
      },
      theme: AppThemeData.light(),
      navigatorKey: _navigatorKey,
      builder: (_, child) {
        return MultiBlocListener(listeners: [
          BlocListener<AppBloc, AppState>(
            listenWhen: (previous, current) => previous.status != current.status,
            listener: (_, state) {
              if (state.status == AppStatus.done) {
                _navigator!.pushNamedAndRemoveUntil(PodsScreen.routeName, (route) => false);
              }
            },
          ),
          BlocListener<AuthBloc, AuthState>(
            listenWhen: (previous, current) => previous.status != current.status,
            listener: (_, state) {
              if (state.status == AuthStatus.unauthenticated) {
                _navigator!.pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false);
              }
            },
          )
        ], child: child!);
      },
      onGenerateRoute: AppRoutes.generate(),
    );
  }
}
