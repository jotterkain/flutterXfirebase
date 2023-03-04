import 'package:demo_auth/ui/screens/auth/signup/components/page_views/email.dart';
import 'package:demo_auth/ui/screens/auth/signup/components/page_views/name_birth.dart';
import 'package:demo_auth/ui/screens/auth/signup/components/page_views/otp.dart';
import 'package:demo_auth/ui/screens/auth/signup/components/page_views/phone_number.dart';
import 'package:demo_auth/ui/screens/auth/signup/components/page_views/wait_email_confirmation.dart';
import 'package:flutter/material.dart';
import 'components/no_build.dart' as components;

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page?.round() != currentIndex) {
        setState(() {
          currentIndex = _pageController.page!.round();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0, left: 10.0, right: 10.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            components.header(context),
            const SizedBox(height: 30),
            Flexible(
              flex: 3,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                children: const [
                  NameBirthView(), // 0
                  EmailPageView(), // 1
                  WaitEmailConfirmationPageView(), // 2
                  PhonePageView(), // 3
                  OTPVerification(), // 4
                ],
              ),
            ),
            const Spacer(),
            components.footer(context, currentIndex, _pageController),
          ],
        ),
      ),
    );
  }
}
