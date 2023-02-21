import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senden/ui/screens/auth/signup/components/pageviews/phone_number.dart';
import 'package:senden/ui/screens/auth/signup/components/pageviews/otp_verification.dart';
import 'package:senden/ui/screens/auth/signup/components/pageviews/email_and_password.dart';
import 'package:senden/ui/screens/auth/signup/components/pageviews/wait_for_email_verification.dart';

import '../../../../utils/routes/route_const.dart';
import 'components/pageviews/name_and_birth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  bool processing = false;
  bool otpAllFields = true; // todo: implements it
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId = "";
  late int phoneNumber = int.parse(phoneNumberController.text);

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController nicIdController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    /// Attach a listener which will update the state and refresh the page index
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
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "\$ENDEN",
                        style: GoogleFonts.abrilFatface(fontSize: 40),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Divider(
                          thickness: 3,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Create account",
                    style: GoogleFonts.alata(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 7),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Please, fill in the required information or read more about ",
                            style: GoogleFonts.alata(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          TextSpan(
                            text: "how do we collect and use your data",
                            style: GoogleFonts.alata(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.cyan,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                flex: 10,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: [
                    NameAndBirth(
                        firstNameController: firstNameController,
                        lastNameController: lastNameController,
                        birthDateController: birthDateController,
                        nicIdController: nicIdController),
                    EmailAndPassword(
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                    const WaitForEmailVerification(),
                    const PhoneNumber(),
                    const OTPVerification(),
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentIndex != 0
                      ? MaterialButton(
                          color: Theme.of(context).colorScheme.primary,
                          textTheme: ButtonTextTheme.primary,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          onPressed: (currentIndex == 2 || currentIndex == 3)
                              ? null
                              : () {
                                  switch (currentIndex) {
                                    case 3:
                                      _pageController.animateToPage(
                                          currentIndex - 2,
                                          duration:
                                              const Duration(milliseconds: 400),
                                          curve: Curves.easeIn);
                                      break;
                                    default:
                                      toPreviousPage();
                                      break;
                                  }
                                },
                          child: Text(currentIndex == 4 ? "Cancel" : "Back"),
                        )
                      : TextButton(
                          onPressed: () {
                            context.pushReplacementNamed(RouteConstants.login);
                          },
                          child: Text(
                            "Already have account ?",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                        ),
                  MaterialButton(
                    color: Theme.of(context).colorScheme.primary,
                    textTheme: ButtonTextTheme.primary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    onPressed: (otpAllFields == false || currentIndex == 2)
                        ? null
                        : () {
                            switch (currentIndex) {
                              case 0:
                                if (formKeyNameAndBirth.currentState!
                                    .validate()) {
                                  toNextPage();
                                }
                                break;
                              case 1:
                                if (formKeyEmailAndPassword.currentState!
                                    .validate()) {
                                  createUser(context);
                                }
                                break;
                              case 2:
                                break;
                              case 3:
                                if (formKeyPhoneNumber.currentState!
                                    .validate()) {
                                  initPhoneNumberUpdate();
                                }
                                break;
                              case 4:
                                if (formKeyOTP.currentState!.validate()) {
                                  updatePhoneNumber();
                                }
                                break;
                              default:
                                break;
                            }
                          },
                    child: processing
                        ? SizedBox(
                            height: 14,
                            width: 14,
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          )
                        : Text(currentIndex == 2 ? "Verify" : "Next"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void initPhoneNumberUpdate() {
    phoneNumber = int.parse(phoneNumberController.text);
    setState(() {
      processing = true;
    });
    auth.verifyPhoneNumber(
      phoneNumber: "+237$phoneNumber",
      codeSent: (String verificationId, int? resendToken) async {
        this.verificationId = verificationId;
        setState(() {
          processing = false;
        });
        toNextPage();
      },
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
        auth.signInWithCredential(phoneAuthCredential).then((value) {
          setState(() {
            processing = false;
          });
          context.pushReplacementNamed(RouteConstants.home);
        });
      },
      verificationFailed: (FirebaseAuthException error) {
        log(error.message ?? "no messsage");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message ?? "no message"),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
        setState(() {
          processing = false;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> waitForEmailVerification(BuildContext context) async {
    int counter = 0;
    while (FirebaseAuth.instance.currentUser!.emailVerified == false) {
      log("verified: false");
      if (counter > 90) {
        auth.currentUser?.delete();
        log("user deleted");
        _pageController.jumpToPage(1);
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
    toNextPage();
  }

  void createUser(BuildContext context) {
    setState(() {
      processing = true;
    });
    auth
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      auth.currentUser?.sendEmailVerification().then((value) {
        setState(() {
          processing = false;
        });
        toNextPage();
        waitForEmailVerification(context);
      });
    }).onError((error, stackTrace) {
      setState(() {
        processing = false;
      });
      if (error.runtimeType == FirebaseAuthException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text(error.toString().replaceRange(0, 14, '').split(']')[1]),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    });
  }

  void updatePhoneNumber() {
    String otpSMS =
        "${otpInputController_1.text}${otpInputController_2.text}${otpInputController_3.text}${otpInputController_4.text}${otpInputController_5.text}${otpInputController_6.text}";
    setState(() {
      processing = true;
    });
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpSMS);
    auth.currentUser?.updatePhoneNumber(credential).then((value) {
      setState(() {
        processing = false;
      });
      context.pushReplacementNamed(RouteConstants.home);
    }).onError((error, stackTrace) {
      setState(() {
        processing = false;
      });
      log(error.toString().replaceRange(0, 14, '').split(']')[1]);
      if (error.runtimeType == FirebaseAuthException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text(error.toString().replaceRange(0, 14, '').split(']')[1]),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
        _pageController.jumpToPage(3);
      }
    });
  }

  void toNextPage() {
    _pageController.animateToPage(currentIndex + 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  void toPreviousPage() {
    _pageController.animateToPage(currentIndex - 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }
}
