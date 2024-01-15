import 'package:flutter/material.dart';

class PatientProvider extends ChangeNotifier {
  DateTime dueDate = DateTime.now();
  TextEditingController patientName = TextEditingController();
  TextEditingController babyName = TextEditingController();

  changeDueDate(DateTime date) {
    dueDate = date;
    notifyListeners();
  }
}
