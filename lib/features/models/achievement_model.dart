class Achievement {
  final String title;
  final String description;
  final String date;

  Achievement({
    required this.title,
    required this.description,
    required this.date,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) {
    return Achievement(
      title: json['title'],
      description: json['description'],
      date: json['date'],
    );
  }
}
