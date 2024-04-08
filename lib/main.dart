import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/pages/booked_medication_page.dart';

import 'model/medication_booking_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MedicationBookingModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medication Booking',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Medication Booking'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Бронювання ліків'),
        actions: [
          IconButton(
            icon: const Icon(Icons.medication),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookedMedicationPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Натисніть на кнопку, щоб забронювати ліки:',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<MedicationBookingModel>(context, listen: false)
                    .bookMedication('Парацетамол');
              },
              child: const Text('Забронювати Парацетамол'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Provider.of<MedicationBookingModel>(context, listen: false)
                    .bookMedication('Ібупрофен');
              },
              child: const Text('Забронювати Ібупрофен'),
            )
          ],
        ),
      ),
    );
  }
}
