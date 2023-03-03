import 'package:demo_auth/ui/widgets/custom_field.dart';
import 'package:flutter/material.dart';

GlobalKey<FormState> nameAndBirthFormKey = GlobalKey<FormState>();
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController birthController = TextEditingController();

class NameBirthView extends StatelessWidget {
  const NameBirthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date = "Birth date";
    return Form(
      key: nameAndBirthFormKey,
      child: Column(
        children: [
          CustomField(
            controller: firstNameController,
            textInputAction: TextInputAction.next,
            validator: (txt) {
              if (txt == null || txt.isEmpty) {
                return "Field required";
              } else {
                return null;
              }
            },
            label: const Text("First name"),
          ),
          const SizedBox(height: 10),
          CustomField(
            controller: lastNameController,
            textInputAction: TextInputAction.done,
            validator: (txt) {
              if (txt == null || txt.isEmpty) {
                return "Field required";
              } else {
                return null;
              }
            },
            label: const Text("Last name"),
          ),
          const SizedBox(height: 15),
          CustomField(
            controller: birthController,
            hintText: date,
            suffixIcon: const Icon(Icons.calendar_month_sharp),
            readOnly: true,
          )
        ],
      ),
    );
  }
}
