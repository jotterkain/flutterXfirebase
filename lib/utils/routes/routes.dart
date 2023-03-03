import 'package:demo_auth/ui/screens/auth/login/login.dart';
import 'package:demo_auth/ui/screens/auth/signup/signup.dart';
import 'package:demo_auth/ui/screens/home/home.dart';
import 'package:demo_auth/ui/screens/on_boarding/on_boarding.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> routes = [
  GoRoute(
    path: '/',
    builder: (context, state) => const OnBoardingScreen(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/auth',
    builder: (context, state) => const HomeScreen(),
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),
    ],
  ),
];
