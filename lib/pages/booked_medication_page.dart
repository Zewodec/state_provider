import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/medication_booking_model.dart';

class BookedMedicationPage extends StatelessWidget {
  const BookedMedicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Заброньовані ліки'),
      ),
      body: Consumer<MedicationBookingModel>(
        builder: (context, medicationBookingModel, child) {
          return ListView.builder(
            itemCount: medicationBookingModel.bookedMedications.length,
            itemBuilder: (context, index) {
              return MedicationCard(
                medication: medicationBookingModel.bookedMedications[index],
                deleteMedication: (medicine) {
                  Provider.of<MedicationBookingModel>(context, listen: false)
                      .deleteMedication(index);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class MedicationCard extends StatelessWidget {
  final String medication;
  final Function deleteMedication;

  const MedicationCard({Key? key, required this.medication, required this.deleteMedication})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListTile(
        title: Text(medication),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            deleteMedication(medication);
          },
        ),
      ),
    );
  }
}
