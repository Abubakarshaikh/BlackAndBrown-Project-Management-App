import 'package:flutter/material.dart';
import 'package:mondaycom/add/add.dart';
import 'package:mondaycom/app/app.dart';
import 'package:mondaycom/departments/department.dart';
import 'package:mondaycom/login/view/login_page.dart';
import 'package:mondaycom/messages/view/messages_page.dart';
import 'package:mondaycom/projects/projects.dart';
import 'package:mondaycom/routes/routes.dart';
import 'package:mondaycom/splash/spash_page.dart';

List<Page<dynamic>> onGenerateAppViewPages(
    RouteState state, List<Page<dynamic>> page) {
  switch (state) {
    case RouteState.authenticated:
      return [
        DepartmentsPage.page(),
      ];
    case RouteState.unauthenticated:
      return [
        LoginPage.page(),
      ];
    case RouteState.projects:
      return [
        DepartmentsPage.page(),
        ProjectsPage.page(),
      ];
    case RouteState.createProject:
      return [
        DepartmentsPage.page(),
        AddPage.page(),
      ];
    case RouteState.message:
      return [
        DepartmentsPage.page(),
        ProjectsPage.page(),
        MessagePage.page(),
      ];
    case RouteState.startup:
      return [
        App.page(),
      ];
   case RouteState.splash:
      return [
        SplashPage.page(),
      ];
    default:
      return [
        LoginPage.page(),
      ];
  }
}
