import 'package:count_app/models/alarm.dart';
import 'package:count_app/screens/add_alarm_scren.dart';
import 'package:flutter/material.dart';

import '../widgets/alarm_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Alarm> alarms = [];

  Future<void> addAlarm() async {
    final Alarm? alarm = await Navigator.push<Alarm>(
      context,
      MaterialPageRoute(builder: (context) => const AddAlarmScreen()),
    );

    if (alarm != null) {
      setState(() {
        alarms.add(alarm);
      });
    }
  }

  void toggleAlarm(Alarm alarm, bool enabled) {
    setState(() {
      alarm.enabled = enabled;
    });
  }

  void deleteAlarm(Alarm alarm) {
    setState(() {
      alarms.remove(alarm);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alarma App')),
      body: alarms.isEmpty
          ? const Center(
              child: Text('No tienes alarmas', style: TextStyle(fontSize: 18)),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: alarms.length,
              itemBuilder: (context, index) {
                final alarm = alarms[index];
                return AlarmCard(
                  alarm: alarm,
                  onChanged: (enabled) {
                    toggleAlarm(alarm, enabled);
                  },
                  onDelete: () {
                    deleteAlarm(alarm);
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: addAlarm,
        tooltip: 'Agregar alarma',
        child: const Icon(Icons.add),
      ),
    );
  }
}
