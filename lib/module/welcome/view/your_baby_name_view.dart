import 'package:baby_countdown/common_widget/form_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:baby_countdown/core.dart';
import 'package:provider/provider.dart';

class YourBabyNameView extends StatelessWidget {
  const YourBabyNameView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final patientProvider = Provider.of<PatientProvider>(context, listen: true);

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
              "What is baby your name?",
              style: headerStyle,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Form(
              key: formKey,
              child: FormInputField(
                controller: patientProvider.babyName,
                labelText: "your baby name...",
                validator: (value) {
                  if (value.toString().trim().length <= 1) {
                    showAlertDialog(
                      context,
                      "Baby Name",
                      "Please enter your baby name",
                    );
                    return "";
                  }

                  return null;
                },
                onChanged: (value) {},
                onSaved: (value) {},
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            CustomElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Get.offAll(const TabView());
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
