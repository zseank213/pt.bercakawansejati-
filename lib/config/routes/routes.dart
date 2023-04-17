import 'package:flutter/material.dart';
import 'package:pt_berca_kawan_sejati/lib.dart';

const routeLogin = "/login";
const routeOnBoarding = "/onBoarding";
const routeHome = "/home";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routeHome:
      return MaterialPageRoute(
        builder: (context) => const HomeView(),
      );
  }
  return MaterialPageRoute(
    builder: (context) => SplashScreenView(),
  );
}
