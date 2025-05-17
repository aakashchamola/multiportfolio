class Certification {
  final String title;
  final String institution;
  final String date;
  final List<String> skills;
  final String link;

  Certification({
    required this.title,
    required this.institution,
    required this.date,
    required this.skills,
    required this.link,
  });

  factory Certification.fromJson(Map<String, dynamic> json) {
    return Certification(
      title: json['title'],
      institution: json['institution'],
      date: json['date'],
      skills: List<String>.from(json['skills'] ?? []),
      link: json['link'],
    );
  }
}
