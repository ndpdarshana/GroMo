import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:growMo/app_localizations.dart';
import 'package:growMo/app_theme_data.dart';
import 'package:growMo/login/login_screen.dart';
import 'package:growMo/screens/edit_record_screen.dart';
import 'package:growMo/screens/growth_monitoring_screen.dart';
import 'package:growMo/screens/home_screen.dart';
import 'package:growMo/screens/search_screen.dart';

class App extends StatelessWidget {
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
      theme: AppThemeData.light(),
      home: LoginScreen(),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        EditRecordScreen.routeName: (context) => EditRecordScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),
        GrowthMonitoringScreen.routeName: (context) => GrowthMonitoringScreen()
      },
    );
  }
}
