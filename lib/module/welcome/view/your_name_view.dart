import 'package:baby_countdown/common_widget/form_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:baby_countdown/core.dart';
import 'package:provider/provider.dart';

class YourNameView extends StatelessWidget {
  const YourNameView({super.key});

  @override
  Widget build(BuildContext context) {
    final patientProvider = Provider.of<PatientProvider>(context, listen: true);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: SvgPicture.asset(
                welcomeImg,
                width: 200,
              ),
            ),
            Text(
              "What is your name?",
              style: headerStyle,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Form(
              key: formKey,
              child: FormInputField(
                controller: patientProvider.patientName,
                labelText: "your name...",
                validator: (value) {
                  if (value.toString().trim().isEmpty) {
                    showAlertDialog(context, "Name", "Please enter a name");
                    return "";
                  }
                  return null;
                },
                onChanged: (value) {},
                onSaved: (value) {
                  patientProvider.patientName.text = value.toString();
                },
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            CustomElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Get.to(const YourBabyNameView());
                }
              },
              buttonText: "Save and continue",
            ),
            const SizedBox(
              height: 22.0,
            ),
          ],
        ),
      ),
    ));
  }
}
