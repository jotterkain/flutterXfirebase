import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPInput extends StatelessWidget {
  final TextEditingController controller;
  final int index;
  const OTPInput({Key? key, required this.controller, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: SizedBox(
        height: 65,
        width: 40,
        child: TextFormField(
          maxLength: 1,
          controller: controller,
          cursorHeight: 20,
          keyboardType: TextInputType.number,
          onChanged: (str){
            if(str.isNotEmpty){
              if(index!=6){
                FocusScope.of(context).nextFocus();
              }else{
                FocusScope.of(context).unfocus();
              }
            }
          },
          textAlign: TextAlign.center,
          style: GoogleFonts.publicSans(
            fontWeight: FontWeight.bold,
          ),
          validator: (digit){
            if(digit == null || digit.isEmpty){
              return "";
            }
            return null;
          },
          decoration: const InputDecoration(
            counter: Text(""),
            contentPadding: EdgeInsets.only(bottom: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1)
            ),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1)
            ),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1)
            ),
          ),
        ),
      ),
    );
  }
}
