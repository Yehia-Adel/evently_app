import 'package:evently_app/core/routes/pages_route_name.dart';
import 'package:evently_app/modules/createEvent/pages/create_event_screen.dart';
import 'package:evently_app/modules/forgetPassword/forgetPassword.dart';
import 'package:evently_app/modules/layout/layout.dart';
import 'package:evently_app/modules/onBoarding/pages/on_boarding.dart';
import 'package:evently_app/modules/signIn/sign_in.dart';
import 'package:evently_app/modules/signUp/sign_up.dart';
import 'package:evently_app/modules/splash/splash_screen.dart';
import 'package:flutter/material.dart';

abstract class AppRoutes {
  static Route onGenerateRoute(RouteSettings sitting) {
    switch (sitting.name) {
      case PagesRoutesNames.initial:
        return MaterialPageRoute(
            builder: (context) => SplashScreen(), settings: sitting);
      case PagesRoutesNames.onBoarding:
        return MaterialPageRoute(
            builder: (context) => OnBoarding(), settings: sitting);
      case PagesRoutesNames.signIn:
        return MaterialPageRoute(
            builder: (context) => SignIn(), settings: sitting);
      case PagesRoutesNames.signUp:
        return MaterialPageRoute(
            builder: (context) => SignUp(), settings: sitting);
      case PagesRoutesNames.forgetPassword:
        return MaterialPageRoute(
            builder: (context) => ForgetPassword(), settings: sitting);
      case PagesRoutesNames.layout:
        return MaterialPageRoute(
            builder: (context) => Layout(), settings: sitting);
      case PagesRoutesNames.createEvent:
        return MaterialPageRoute(
            builder: (context) => CreateEventScreen(), settings: sitting);
      default:
        return MaterialPageRoute(
            builder: (context) => SplashScreen(), settings: sitting);
    }
  }
}
