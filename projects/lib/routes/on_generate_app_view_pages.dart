import 'package:flutter/material.dart';
import 'package:projects/app/app.dart';
import 'package:projects/login/view/login_page.dart';
import 'package:projects/messages/view/messages_page.dart';
import 'package:projects/projects/projects.dart';
import 'package:projects/routes/routes.dart';
import 'package:projects/splash/spash_page.dart';

import '../project_details/view/project_details_page.dart';

List<Page<dynamic>> onGenerateAppViewPages(
    RouteState state, List<Page<dynamic>> page) {
  switch (state) {
    case RouteState.authenticated:
      return [
        ProjectsPage.page(),
      ];
    case RouteState.unauthenticated:
      return [
        LoginPage.page(),
      ];
    case RouteState.message:
      return [
        ProjectsPage.page(),
        MessagePage.page(),
      ];
    case RouteState.splashPage:
      return [
        SplashPage.page(),
      ];
    case RouteState.startup:
      return [
        App.page(),
      ];
    case RouteState.projectsDetails:
      return [
        ProjectsPage.page(),
        ProjectDetailsPage.page(),
      ];
    default:
      return [
        LoginPage.page(),
      ];
  }
}
