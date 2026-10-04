class Alarm {
  final int id;
  final int hour;
  final int minute;
  bool enabled;

  Alarm({
    required this.id,
    this.enabled = true,
    required this.hour,
    required this.minute,
  });
}
