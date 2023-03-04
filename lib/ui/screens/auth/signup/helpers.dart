import 'dart:developer';
import 'package:flutter/cupertino.dart';
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

void nextButtonCase(int index, PageController pageController) {
  switch (index) {
    case 0:
      if (nameAndBirthFormKey.currentState!.validate()) {
        toNextPage(pageController, index);
      }
      break;
    case 1:
      if (emailFormKey.currentState!.validate()) {
        toNextPage(pageController, index);
        Future.delayed(
          const Duration(seconds: 3), () {
            toNextPage(pageController, index+2);
          },
        );
      }
      break;
    case 3:
      break;
    default:
      log("Page index is: $index");
      break;
  }
}
