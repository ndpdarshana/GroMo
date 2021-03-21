import 'package:flutter/material.dart';
import 'package:growMo/child_record_editor/child_record_editor_screen.dart';
import 'package:growMo/login/login_screen.dart';
import 'package:growMo/models/pod.dart';
import 'package:growMo/pod_details/pod_details_screen.dart';
import 'package:growMo/pod_list/pods_screen.dart';
import 'package:growMo/splash_screen.dart';

class AppRoutes {
  static generate() {
    return (settings) {
      Widget widget;
      switch (settings.name) {
        case '/':
          widget = SplashScreen();
          break;
        case LoginScreen.routeName:
          widget = LoginScreen();
          break;
        case PodsScreen.routeName:
          widget = PodsScreen();
          break;
        case PodDetailsScreen.routeName:
          Pod pod = settings.arguments;
          widget = PodDetailsScreen(pod: pod);
          break;
        case ChildRecordEditorScreen.routeName:
          Pod pod = settings.arguments;
          widget = ChildRecordEditorScreen(pod: pod);
          break;
        // case HomeScreen.routeName:
        //   widget = HomeScreen();
        //   break;
        // case EditRecordScreen.routeName:
        //   widget = EditRecordScreen();
        //   break;
        // case SearchScreen.routeName:
        //   widget = SearchScreen();
        //   break;
        // case GrowthMonitoringScreen.routeName:
        //   widget = GrowthMonitoringScreen();
        //   break;
      }
      return MaterialPageRoute(builder: (_) => widget, settings: settings);
    };
  }
}
