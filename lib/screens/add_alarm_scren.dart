import 'package:flutter/material.dart';

import '../models/alarm.dart';

class AddAlarmScreen extends StatefulWidget {
  const AddAlarmScreen({super.key});

  @override
  State<AddAlarmScreen> createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends State<AddAlarmScreen> {
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> selectTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  void saveAlarm() {
    final alarm = Alarm(
      id: DateTime.now().millisecondsSinceEpoch,
      hour: selectedTime.hour,
      minute: selectedTime.minute,
    );

    Navigator.pop(context, alarm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nueva alarma')),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          children: [
            Text(
              selectedTime.format(context),
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: selectTime,
              child: const Text('Seleccionar hora'),
            ),

            const SizedBox(height: 24),

            ElevatedButton(onPressed: saveAlarm, child: const Text('Guardar')),
          ],
        ),
      ),
    );
  }
}
