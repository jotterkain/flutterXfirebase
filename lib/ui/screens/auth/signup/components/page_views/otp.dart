import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../widgets/otp_input.dart';


TextEditingController otpInputController_1 = TextEditingController();
TextEditingController otpInputController_2 = TextEditingController();
TextEditingController otpInputController_3 = TextEditingController();
TextEditingController otpInputController_4 = TextEditingController();
TextEditingController otpInputController_5 = TextEditingController();
TextEditingController otpInputController_6 = TextEditingController();

GlobalKey<FormState> formKeyOTP = GlobalKey<FormState>();
int timeLeft = 90;

class OTPVerification extends StatelessWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyOTP,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:
            EdgeInsets.only(right: MediaQuery.of(context).size.width / 7),
            child: Text(
              "We've sent you a six digits code, please fill it to proceed.",
              style: GoogleFonts.alata(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.grey.shade800,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              OTPInput(controller: otpInputController_1, index: 1),
              OTPInput(controller: otpInputController_2, index: 2),
              OTPInput(controller: otpInputController_3, index: 3),
              OTPInput(controller: otpInputController_4, index: 4),
              OTPInput(controller: otpInputController_5, index: 5),
              OTPInput(controller: otpInputController_6, index: 6),
            ],
          ),
          const SizedBox(height: 20),
          StatefulBuilder(
            builder: (context,setState){
              Timer.periodic(const Duration(seconds: 1), (Timer t){

              });
              return Text(
                "You'll be able to resend the code in $timeLeft seconds",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600, color: Colors.black,
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}