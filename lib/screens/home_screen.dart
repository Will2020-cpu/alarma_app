import 'package:count_app/screens/add_alarm_scren.dart';
import 'package:flutter/material.dart';

import '../widgets/alarm_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alarma App')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AlarmCard(
            time: '07:00',
            days: 'Lunes, Martes, Miércoles, Jueves, Viernes',
            enabled: true,
          ),
          AlarmCard(time: '08:00', days: 'Sábado, Domingo', enabled: false),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddAlarmScreen()),
          );
        },
        tooltip: 'Agregar alarma',
        child: const Icon(Icons.add),
      ),
    );
  }
}
