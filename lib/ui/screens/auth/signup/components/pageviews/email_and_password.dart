import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senden/ui/widgets/custom_field.dart';

GlobalKey<FormState> formKeyEmailAndPassword = GlobalKey<FormState>();

bool passwordHidden = false;

class EmailAndPassword extends StatelessWidget {

  final TextEditingController emailController;
  final TextEditingController passwordController;

  const EmailAndPassword({Key? key, required this.emailController, required this.passwordController}) : super(key: key);

  static bool isValidEmail(String email) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+([\.][^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  static bool isValidPassword(String password){
    return RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$+!%?])[A-Za-z\d@#+$!%?]{8,}$').hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyEmailAndPassword,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding:
                EdgeInsets.only(right: MediaQuery.of(context).size.width / 7),
            child: Text(
              "Please, enter your email address and choose a password",
              style: GoogleFonts.alata(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.grey.shade800,
              ),
            ),
          ),
          const SizedBox(height: 20),
          CustomField(
            textInputAction: TextInputAction.next,
            label: const Text("Email"),
            validator: (txt){
              if(txt==null || !isValidEmail(txt)){
                return "Invalid email";
              }else{
                return null;
              }
            },
            prefixIcon: const Icon(Icons.mail),
            controller: emailController,
          ),
          StatefulBuilder(
            builder: (context, setState) {
              return CustomField(
                textInputAction: TextInputAction.done,
                obscureText: passwordHidden,
                prefixIcon: const Icon(Icons.lock),
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
          )
        ],
      ),
    );
  }
}
