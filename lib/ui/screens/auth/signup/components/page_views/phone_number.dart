import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

GlobalKey<FormState> phoneNumberFormKey = GlobalKey<FormState>();
TextEditingController phoneNumberController = TextEditingController();

class PhonePageView extends StatelessWidget {
  const PhonePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: phoneNumberFormKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width / 7),
            child: Text(
              "Please enter your phone number, we will send you a 6 digits code to verify your identity.",
              style: GoogleFonts.alata(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.grey.shade800,
              ),
            ),
          ),
          const SizedBox(height: 30),
          IntlPhoneField(
            initialCountryCode: "CM",
            controller: phoneNumberController,
            dropdownTextStyle: const TextStyle(fontWeight: FontWeight.w500),
            style: const TextStyle(fontWeight: FontWeight.w500),
            cursorColor: Colors.grey.shade500,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(5)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey.shade600),
                borderRadius: BorderRadius.circular(5),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: Theme.of(context).colorScheme.error),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: Theme.of(context).colorScheme.error),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
