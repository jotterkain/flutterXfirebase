import 'dart:developer';
import 'package:demo_auth/ui/screens/auth/signup/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'components/page_views/email.dart';
import 'components/page_views/name_birth.dart';

void toNextPage(PageController pageController, int index) {
  pageController.animateToPage(index + 1,
      duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
}

void toPreviousPage(PageController pageController, int index) {
  pageController.animateToPage(index - 1,
      duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
}

void backButtonCase(int index, PageController pageController) {
  switch (index) {
    case 1:
      toPreviousPage(pageController, index);
      break;
    default:
      log("Page index is: $index");
      break;
  }
}

void nextButtonCase(
    int index, PageController pageController, BuildContext context) {
  switch (index) {
    case 0:
      if (nameAndBirthFormKey.currentState!.validate()) {
        toNextPage(pageController, index);
      }
      break;
    case 1:
      if (emailFormKey.currentState!.validate()) {
        createUserWithEmailAndPassword(context, pageController);
      }
      break;
    case 3:
      break;
    default:
      log("Page index is: $index");
      break;
  }
}

/// FIREBASE

void createUserWithEmailAndPassword(
    BuildContext context, PageController pageController) {
  processing.value = true;
  final auth = FirebaseAuth.instance;
  auth
      .createUserWithEmailAndPassword(
    email: emailController.text,
    password: passwordController.text,
  )
      .then((value) {
    auth.currentUser?.sendEmailVerification().then((value) {
      processing.value = false;
      toNextPage(pageController, 1);
      waitForEmailVerification(context, pageController);
    });
  }).onError((error, stackTrace) {
    processing.value = false;
    if (error.runtimeType == FirebaseAuthException) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString().replaceRange(0, 14, '').split(']')[1]),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  });
}

Future<void> waitForEmailVerification(
    BuildContext context, PageController pageController) async {
  final auth = FirebaseAuth.instance;
  int counter = 0;
  while (FirebaseAuth.instance.currentUser!.emailVerified == false) {
    log("verified: false");
    if (counter > 90) {
      auth.currentUser?.delete();
      log("user deleted");
      pageController.jumpToPage(1);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          dismissDirection: DismissDirection.vertical,
          content: const Text("We've waited too long, please try again"),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      );
      return;
    }
    await Future.delayed(const Duration(seconds: 1), () {
      FirebaseAuth.instance.currentUser!.reload();
      counter++;
    });
  }
  toNextPage(pageController, 2);
}
