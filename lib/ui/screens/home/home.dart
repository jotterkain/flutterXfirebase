import 'dart:developer';
import 'package:demo_auth/utils/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialButton(
              color: Theme.of(context).colorScheme.primary,
              textTheme: ButtonTextTheme.primary,
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 15),
              onPressed: (){
                log(auth.currentUser?.isAnonymous.toString()??"No isAnonymous");
                log(auth.currentUser?.phoneNumber??"no phone");
                log(auth.currentUser?.email??"no email");
                auth.signOut();
                context.pushReplacementNamed(RouteNames.signup);
              },
              child: const Text("Log out"),
            ),
            const SizedBox(height: 50),
            MaterialButton(
              color: Theme.of(context).colorScheme.primary,
              textTheme: ButtonTextTheme.primary,
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 15),
              onPressed: (){
                auth.currentUser?.delete();
                context.pushReplacementNamed(RouteNames.signup);
              },
              child: const Text("Delete user"),
            )
          ],
        ),
      ),
    );
  }
}