class Experience {
  final String company;
  final String industry;
  final String location;
  final List<Role> roles;

  Experience({
    required this.company,
    required this.industry,
    required this.location,
    required this.roles,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      company: json['company'],
      industry: json['industry'],
      location: json['location'],
      roles: List<Role>.from(
        json['roles']?.map((role) => Role.fromJson(role)) ?? [],
      ),
    );
  }
}

class Role {
  final String role;
  final String startDate;
  final String endDate;
  final List<String> responsibilities;

  Role({
    required this.role,
    required this.startDate,
    required this.endDate,
    required this.responsibilities,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      role: json['role'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      responsibilities: List<String>.from(json['responsibilities'] ?? []),
    );
  }
}
