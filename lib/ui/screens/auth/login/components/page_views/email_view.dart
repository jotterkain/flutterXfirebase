import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senden/ui/widgets/custom_field.dart';
import 'package:senden/utils/routes/route_const.dart';

GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

class LoginWithEmailView extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginWithEmailView({Key? key, required this.emailController, required this.passwordController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool passwordHidden = true;
    bool isValidEmail(String email) {
      return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+([\.][^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(email);
    }
    bool isValidPassword(String password){
      return RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$+!%?])[A-Za-z\d@#+$!%?]{8,}$').hasMatch(password);
    }
    return Form(
      key: loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomField(
            validator: (txt){
              if(txt==null || !isValidEmail(txt)){
                return "Invalid email";
              }else{
                return null;
              }
            },
            prefixIcon: const Icon(Icons.email),
            label: const Text("Email"),
            controller: emailController,
          ),
          StatefulBuilder(
            builder: (context, setState) {
              return CustomField(
                validator: (txt){
                  if(txt==null || !isValidPassword(txt)) {
                    return "Password must have: \n"
                        "At least 8 characters\n"
                        "At least one uppercase character\n"
                        "At least one lowercase character\n"
                        "At least one number\n"
                        "At least one special character [@#\$!%?]";
                  }else{
                    return null;
                  }
                },
                obscureText: passwordHidden,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      passwordHidden = !passwordHidden;
                    });
                  },
                  child: Icon(
                      passwordHidden ? Icons.visibility : Icons.visibility_off),
                ),
                label: const Text("Password"),
                controller: passwordController,
              );
            },
          ),
          const SizedBox(height: 30),
          RichText(
            text: TextSpan(
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                      text: "I forgot my password.",
                      recognizer: TapGestureRecognizer()..onTap = () {
                        context.pushNamed(RouteConstants.recover);
                      },
                      style: const TextStyle(
                          color: Colors.cyan, fontWeight: FontWeight.bold))
                ]),
          )
        ],
      ),
    );
  }
}
