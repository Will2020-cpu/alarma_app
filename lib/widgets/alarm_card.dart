import 'package:flutter/material.dart';

import '../models/alarm.dart';

class AlarmCard extends StatelessWidget {
  final Alarm alarm;
  final ValueChanged<bool> onChanged;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const AlarmCard({
    super.key,
    required this.alarm,
    required this.onChanged,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(alarm.id),

      direction: DismissDirection.endToStart,

      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, size: 30),
      ),

      onDismissed: (direction) {
        onDelete();
      },

      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
          title: Text(
            '${alarm.hour.toString().padLeft(2, '0')}:'
            '${alarm.minute.toString().padLeft(2, '0')}',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: onEdit,
                tooltip: 'Editar Alarma',
                icon: const Icon(Icons.edit, color: Colors.tealAccent),
              ),
              Switch(
                value: alarm.enabled,
                onChanged: onChanged,
                activeThumbColor: const Color(0xFF00E5FF),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
