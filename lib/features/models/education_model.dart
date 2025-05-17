class Education {
  final String institution;
  final String degree;
  final String startDate;
  final String endDate;
  final String? cgpa;
  final String? percentage;

  Education({
    required this.institution,
    required this.degree,
    required this.startDate,
    required this.endDate,
    this.cgpa,
    this.percentage,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      institution: json['institution'],
      degree: json['degree'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      cgpa: json['cgpa'],
      percentage: json['percentage'],
    );
  }
}
