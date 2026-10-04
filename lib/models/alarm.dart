class Alarm {
  final int id;
  final DateTime time;
  final bool enabled;

  Alarm({required this.id, required this.time, this.enabled = true});

  bool get isActive => enabled;
}
