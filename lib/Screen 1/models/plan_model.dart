class Plan {
  final int id;
  final String title;
  final String level;
  final String date;
  final String time;
  final String room;
  final String trainer;
  final String createdAt;

  Plan({
    required this.id,
    required this.title,
    required this.level,
    required this.date,
    required this.time,
    required this.room,
    required this.trainer,
    required this.createdAt,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      id: json['id'] is int ? json['id'] : int.tryParse('${json['id']}') ?? 0,
      title: json['title']?.toString() ?? '',
      level: json['level']?.toString() ?? '',
      date: json['date']?.toString() ?? '',
      time: json['time']?.toString() ?? '',
      room: json['room']?.toString() ?? '',
      trainer: json['trainer']?.toString() ?? '',
      createdAt: json['created_at']?.toString() ?? '',
    );
  }
}