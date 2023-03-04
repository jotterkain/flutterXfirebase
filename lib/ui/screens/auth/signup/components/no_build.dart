import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers.dart' as helpers;

Widget header(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "FXF-DEMO",
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
      const SizedBox(height: 10),
      Text(
        "Register",
        style: GoogleFonts.alata(
          fontWeight: FontWeight.w900,
          fontSize: 30,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 7),
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
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}

Widget footer(BuildContext context, int index, PageController pageController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (index != 2)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            index != 0
                ? MaterialButton(
                    color: Colors.black,
                    onPressed: index == 3 || index == 4
                        ? null
                        : () {
                            helpers.backButtonCase(index, pageController);
                          },
                    child: const Text(
                      "Back",
                    ),
                  )
                : TextButton(
                    onPressed: () {},
                    child: Text(
                      "Already have account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
            MaterialButton(
              color: Colors.black,
              onPressed: () {
                helpers.nextButtonCase(index, pageController);
              },
              child: const Text(
                "Next",
              ),
            ),
          ],
        )
    ],
  );
}
