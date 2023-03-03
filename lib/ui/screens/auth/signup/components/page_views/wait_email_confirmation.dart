import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WaitEmailConfirmationPageView extends StatelessWidget {
  const WaitEmailConfirmationPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
          EdgeInsets.only(right: MediaQuery.of(context).size.width / 7),
          child: Text(
            "We've sent you an email verification link, please follow the instruction to proceed",
            style: GoogleFonts.alata(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.grey.shade800,
            ),
          ),
        )
      ],
    );;
  }
}
