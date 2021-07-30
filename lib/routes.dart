import 'package:flutter/material.dart';
import '/child_details/child_details_screen.dart';
import '/child_record_editor/child_record_editor_screen.dart';
import '/login/login_screen.dart';
import '/models/child.dart';
import '/models/pod.dart';
import '/growth_record_editor/growth_record_editor_screen.dart';
import '/pod_details/pod_details_screen.dart';
import '/pod_list/pods_screen.dart';
import '/splash_screen.dart';

class AppRoutes {
  static generate() {
    return (settings) {
      late Widget widget;
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
        case ChildDetailsSecreen.routeName:
          Child child = settings.arguments;
          widget = ChildDetailsSecreen(child: child);
          break;
        case GrowthRecordEditorScreen.routeName:
          Child child = settings.arguments;
          widget = GrowthRecordEditorScreen(child: child);
          break;
      }
      return MaterialPageRoute(builder: (_) => widget, settings: settings);
    };
  }
}
