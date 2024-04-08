import 'package:flutter/material.dart';

class MedicationBookingModel extends ChangeNotifier {
  List<String> _bookedMedications = [];

  List<String> get bookedMedications => _bookedMedications;

  // Додавання ліків
  void bookMedication(String medication) {
    _bookedMedications.add(medication);
    notifyListeners();
  }

  void deleteMedication(int index) {
    _bookedMedications.removeAt(index);
    notifyListeners();
  }
}
