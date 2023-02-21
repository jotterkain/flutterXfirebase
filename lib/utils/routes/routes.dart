import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:senden/ui/screens/auth/login/login.dart';
import 'package:senden/ui/screens/auth/recover_password/recover_password.dart';
import 'package:senden/ui/screens/auth/signup/signup.dart';
import 'package:senden/utils/routes/route_const.dart';
import '../../ui/screens/home/home.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        name: RouteConstants.home,
        pageBuilder: (context, state) =>
            const MaterialPage(child: HomeScreen()),
        redirect: (context, state) async {
          FirebaseAuth auth = FirebaseAuth.instance;
          if (auth.currentUser==null) {
            return state.namedLocation(RouteConstants.signup);
          } else {
            if(auth.currentUser?.phoneNumber == null || auth.currentUser!.phoneNumber!.isEmpty){
              auth.currentUser?.delete();
              return state.namedLocation(RouteConstants.signup);
            }
            return null;
          }
        },
      ),
      GoRoute(
        path: "/login",
        name: RouteConstants.login,
        pageBuilder: (context, state) =>
            const MaterialPage(child: LoginScreen()),
      ),
      GoRoute(
        path: "/signup",
        name: RouteConstants.signup,
        pageBuilder: (context, state) =>
            const MaterialPage(child: SignUpScreen()),
      ),
      GoRoute(
        path: "/recover",
        name: RouteConstants.recover,
        pageBuilder: (context, state) =>
        const MaterialPage(child: RecoverPassWordScreen()),
      ),
    ],
  );
}
