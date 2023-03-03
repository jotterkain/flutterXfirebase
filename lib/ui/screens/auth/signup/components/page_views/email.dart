import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../utils/regex.dart' as regexes;
import '../../../../../widgets/custom_field.dart';


GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
bool passwordHidden = true;
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class EmailPageView extends StatelessWidget {
  const EmailPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: emailFormKey,
      child: Column(
        children: [
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
              if(txt==null || !regexes.isValidEmail(txt)){
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
                  if(txt==null || !regexes.isValidPassword(txt)) {
                    return "Password must have: \n"
                        "At least 8 characters\n"
                        "At least one uppercase character\n"
                        "At least one lowercase character\n"
                        "At least one number\n"
                        "At least one special character [@#\$!%+?]";
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
