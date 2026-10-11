import 'package:flutter/material.dart';

import '../models/alarm.dart';

class AddAlarmScreen extends StatefulWidget {
  final Alarm? alarm;

  const AddAlarmScreen({super.key, this.alarm});

  @override
  State<AddAlarmScreen> createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends State<AddAlarmScreen> {
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();

    selectedTime = widget.alarm != null
        ? TimeOfDay(hour: widget.alarm!.hour, minute: widget.alarm!.minute)
        : TimeOfDay.now();
  }

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
      id: widget.alarm?.id ?? DateTime.now().millisecondsSinceEpoch,
      hour: selectedTime.hour,
      minute: selectedTime.minute,
    );

    Navigator.pop(context, alarm);
  }

  @override
  Widget build(BuildContext context) {
    final bool isEditing = widget.alarm != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Editar alarma' : 'Nueva alarma')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                selectedTime.format(context),
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: selectTime,
                child: const Text('Seleccionar hora'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: saveAlarm,
                child: Text(isEditing ? 'Guardar cambios' : 'Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
