import 'package:flutter/material.dart';

import '../models/alarm.dart';

class AlarmCard extends StatelessWidget {
  final String time;
  final String days;
  final bool enabled;

  const AlarmCard({
    super.key,
    required this.time,
    required this.days,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        title: Text(
          time,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(days, style: const TextStyle(fontSize: 16)),
        trailing: Switch(
          value: enabled,
          onChanged: (value) {
            // TODO: Mas tarde revisaremos el estado del boton
          },
        ),
      ),
    );
  }
}
