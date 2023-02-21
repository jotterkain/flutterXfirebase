import 'package:flutter/material.dart';
import 'package:senden/ui/widgets/custom_field.dart';

GlobalKey<FormState> formKeyNameAndBirth = GlobalKey<FormState>();

class NameAndBirth extends StatelessWidget {

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController nicIdController;
  final TextEditingController birthDateController;

  const NameAndBirth({Key? key, required this.firstNameController, required this.lastNameController, required this.nicIdController, required this.birthDateController}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    String date = birthDateController.text;
    String label = "Birth Date";
    return Form(
      key: formKeyNameAndBirth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 3),
          CustomField(
            controller: firstNameController,
            textInputAction: TextInputAction.next,
            validator: (txt){
              if(txt==null || txt.isEmpty){
                return "Field required";
              }else{
                return null;
              }
            },
            label: const Text("First name"),
          ),
          const SizedBox(height: 20),
          CustomField(
            controller: lastNameController,
            textInputAction: TextInputAction.next,
            validator: (txt){
              if(txt==null || txt.isEmpty){
                return "Field required";
              }else{
                return null;
              }
            },
            label: const Text("Last name"),
          ),
          const SizedBox(height: 20),
          CustomField(
            controller: nicIdController,
            maxLength: 9,
            textInputAction: TextInputAction.done,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            validator: (txt){
              if(txt==null || txt.isEmpty || txt.length!=9 || RegExp(r'^\d+$').hasMatch(txt)==false){
                return "Field required";
              }else{
                return null;
              }
            },
            label: const Text("National card ID"),
          ),
          const SizedBox(height: 20),
          StatefulBuilder(
            builder: (context,setState){
              return CustomField(
                controller: birthDateController,
                readOnly: true,
                onTapOutside: (pt){
                  FocusScope.of(context).unfocus();
                },
                label: Text(label),
                validator: (txt){
                  if(date.isEmpty){
                    return "field required";
                  }
                  birthDateController.text = date;
                  return null;
                },
                suffixIcon: GestureDetector(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime(2005, 1, 1),
                      firstDate: DateTime(1850),
                      lastDate: DateTime.now().subtract(const Duration(days: 365*18)),
                    ).then((value){
                      if(value!=null){
                        setState((){
                          date = label = value.toLocal().toString().substring(0,10);
                          birthDateController.text = date;
                        });
                      }
                    });
                  },
                  child: const Icon(Icons.calendar_month_sharp),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
