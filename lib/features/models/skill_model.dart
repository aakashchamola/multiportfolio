class Skill {
  final String name;

  Skill({required this.name});

  factory Skill.fromJson(String name) {
    return Skill(name: name);
  }
}
