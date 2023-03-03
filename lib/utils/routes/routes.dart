import 'package:demo_auth/ui/screens/auth/login/login.dart';
import 'package:demo_auth/ui/screens/auth/signup/signup.dart';
import 'package:demo_auth/ui/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(routes: routes);
}

List<RouteBase> routes = [
  GoRoute(
      path: '/',
      name: RouteNames.home,
      pageBuilder: (context, state) => const MaterialPage(child: HomeScreen()),
      redirect: (context, state) async {
        FirebaseAuth auth = FirebaseAuth.instance;
        // whatever the routes an user is following if he is not logged in, he's redirected
        if (auth.currentUser == null) {
          return state.namedLocation(RouteNames.signup);
        }
        return null;
      },
      routes: [
        ShellRoute(
          builder:(context,state,child) => Scaffold(body: child),
          routes: [
            GoRoute(
              path: 'login',
              name: RouteNames.login,
              pageBuilder: (context, state) => const MaterialPage(child: LoginScreen()),
            ),
            GoRoute(
              path: 'signup',
              name: RouteNames.signup,
              pageBuilder: (context, state) => const MaterialPage(child: SignupScreen()),
            ),
          ],
        ),
      ]),
];

class RouteNames {
  static String home = "home";
  static String login = "login";
  static String signup = "signup";
}
