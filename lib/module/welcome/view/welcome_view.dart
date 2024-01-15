import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:baby_countdown/core.dart';
import 'package:provider/provider.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
              "What is your babies estimated birthday ?",
              style: headerStyle,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Estimate due date:",
                  style: header,
                ),
                OutlinedButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(9999),
                    );

                    if (pickedDate != null) {
                      patientProvider.changeDueDate(pickedDate);
                    }
                  },
                  child: Text(
                    convertDate(patientProvider.dueDate),
                    style: headerStyle,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            CustomElevatedButton(
              onPressed: () {
                Get.to(const YourNameView());
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
