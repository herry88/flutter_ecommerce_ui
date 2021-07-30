import 'package:flutter/material.dart';
import 'package:flutteruinew/src/screen/buttonNavigation/tab_down.dart';
import 'package:flutteruinew/src/screen/onBoarding.dart';
import 'package:flutteruinew/src/screen/signup/signup.dart';

import 'src/screen/categories/categories.dart';
import 'src/screen/signin/signinpage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => OnBoardingWidget());
      case '/SignUp':
        return MaterialPageRoute(builder: (_) => SignUpWidget());
      case '/SignIn':
        return MaterialPageRoute(builder: (_) => SignInWidget());
      case '/Tabs':
        return MaterialPageRoute(builder: (_) => TabsWidget());
      case '/Categories':
        return MaterialPageRoute(builder: (_) => CategoryWidget());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Image.network(
            'https://bengkulu.bpk.go.id/wp-content/uploads/2017/09/Under-construction.png',
            fit: BoxFit.cover,
          ),
        ),
      );
    });
  }
}
