import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:growMo/app_localizations.dart';
import 'package:growMo/screens/search_screen.dart';
import './screens/edit_record_screen.dart';
import './screens/growth_monitoring_screen.dart';
import './screens/home_screem.dart';

import './screens/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // if the locale of the device is not supported, use the first one
        // from the list (English, in this case)
        return supportedLocales.first;
      },
      theme: ThemeData(primaryColor: Colors.blue),
      home: AuthScreen(),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        EditRecordScreen.routeName: (context) => EditRecordScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),
        GrowthMonitoringScreen.routeName: (context) => GrowthMonitoringScreen()
      },
    );
  }
}
