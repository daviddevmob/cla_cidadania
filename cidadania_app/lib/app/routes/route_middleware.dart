import 'dart:async';

import 'package:cidadania_app/app/controllers/adm_controller.dart';
import 'package:cidadania_app/app/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:routefly/routefly.dart';

class AppRouteMiddleware {
  final AdmController admController = GetIt.I.get<AdmController>();
  FutureOr<RouteInformation> guardRoute(RouteInformation routeInformation) async {
    bool isAdmMode = await admController.isAdmMode();
    if (!isAdmMode && (routeInformation.uri.path.contains(RouteName.adm_home))) {
      return routeInformation.redirect(Uri.parse(RouteName.home));
    }
    return routeInformation;
  }
}