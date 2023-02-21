import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senden/utils/routes/route_const.dart';
import 'components/page_views/email_view.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                    "Welcome back",
                    style: GoogleFonts.alata(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 7),
                    child: Text(
                      "Please enter your email and password to login to your account.",
                      style: GoogleFonts.alata(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  LoginWithEmailView(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  const SizedBox(height: 30),
                  RichText(
                    text: TextSpan(
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(
                            text: "Don't have an account? ",
                          ),
                          TextSpan(
                              text: "register.",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.pushReplacementNamed(RouteConstants.signup);
                                },
                              style: const TextStyle(
                                  color: Colors.cyan,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                ],
              ),
              const Spacer(),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                textTheme: ButtonTextTheme.primary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                onPressed: () {
                  if (loginFormKey.currentState!.validate()) {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    auth
                        .signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text)
                        .then((value) {
                      if (value.user != null) {
                        context.pushReplacementNamed(RouteConstants.home);

                      }
                    }).onError((error, stackTrace) {
                      if (error.runtimeType == FirebaseAuthException) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(error
                                .toString()
                                .replaceRange(0, 14, '')
                                .split(']')[1].split("or ")[0]),
                            backgroundColor:
                                Theme.of(context).colorScheme.error,
                          ),
                        );
                      }
                    });
                  }
                },
                child: const Text("Log in"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
