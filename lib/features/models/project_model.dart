class Project {
  final String title;
  final List<String> techStack;
  final String description;
  final String link;

  Project({
    required this.title,
    required this.techStack,
    required this.description,
    required this.link,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json['title'],
      techStack: List<String>.from(json['techStack'] ?? []),
      description: json['description'],
      link: json['link'],
    );
  }
}
