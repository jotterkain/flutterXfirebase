import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senden/ui/widgets/custom_field.dart';

class RecoverPassWordScreen extends StatelessWidget {
  const RecoverPassWordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nicController = TextEditingController();
    List<bool> selections = List.generate(2, (_)=>false );
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
                    "Password forgotten?",
                    style: GoogleFonts.alata(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 7),
                    child: Text(
                      "Don't worry. Fill the required field and you'll receive a code that we'll use to reset your password",
                      style: GoogleFonts.alata(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomField(
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    controller: nicController,
                    validator: (txt){
                      if(txt == null || txt.isEmpty || txt.length!=9 || RegExp(r'^\d+$').hasMatch(txt)==false){
                        return "Invalid ID";
                      }else{
                        return null;
                      }
                    },
                    label: const Text("National card ID"),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 7),
                    child: Text(
                      "Recover by: ",
                      style: GoogleFonts.alata(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  StatefulBuilder(
                    builder: (context,setState){
                      return ToggleButtons(
                        isSelected: selections,
                        color: Colors.grey.shade600,
                        textStyle: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700
                        ),
                        onPressed: (i){
                          selections[i]=!selections[i];
                          setState((){});
                        },
                        borderWidth: 2,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Phone number"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Email address"),
                          )
                        ],
                      );
                    },
                  ),
                ],
              ),
              const Spacer(),
              MaterialButton(
                color: Theme.of(context).colorScheme.primary,
                textTheme: ButtonTextTheme.primary,
                padding:
                const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                onPressed: () {},
                child: const Text("Proceed"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
