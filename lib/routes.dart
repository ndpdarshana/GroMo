import 'package:flutter/material.dart';
import 'package:growMo/child_details/child_details_screen.dart';
import 'package:growMo/child_record_editor/child_record_editor_screen.dart';
import 'package:growMo/login/login_screen.dart';
import 'package:growMo/models/child.dart';
import 'package:growMo/models/pod.dart';
import 'package:growMo/monitor_record_editor/monitor_record_editor_screen.dart';
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
        case ChildDetailsSecreen.routeName:
          Child child = settings.arguments;
          widget = ChildDetailsSecreen(child: child);
          break;
        case MonitorRecordEditorScreen.routeName:
          Child child = settings.arguments;
          widget = MonitorRecordEditorScreen(child: child);
          break;
      }
      return MaterialPageRoute(builder: (_) => widget, settings: settings);
    };
  }
}
