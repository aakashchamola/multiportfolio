import 'package:multiportfolio/features/models/achievement_model.dart';
import 'package:multiportfolio/features/models/certification_model.dart';
import 'package:multiportfolio/features/models/education_model.dart';
import 'package:multiportfolio/features/models/experience_model.dart';
import 'package:multiportfolio/features/models/profile_model.dart';
import 'package:multiportfolio/features/models/project_model.dart';

class Portfolio {
  final Profile profile;
  final List<Experience> experience;
  final List<Education> education;
  final List<String> skills;
  final List<Certification> certifications;
  final List<Achievement> achievements;
  final List<Project> projects;

  Portfolio({
    required this.profile,
    required this.experience,
    required this.education,
    required this.skills,
    required this.certifications,
    required this.achievements,
    required this.projects,
  });

  factory Portfolio.fromJson(Map<String, dynamic> json) {
    return Portfolio(
      profile: Profile.fromJson(json['profile']),
      experience: List<Experience>.from(
        json['experience']?.map((e) => Experience.fromJson(e)) ?? [],
      ),
      education: List<Education>.from(
        json['education']?.map((e) => Education.fromJson(e)) ?? [],
      ),
      skills: List<String>.from(json['skills'] ?? []),
      certifications: List<Certification>.from(
        json['certifications']?.map((e) => Certification.fromJson(e)) ?? [],
      ),
      achievements: List<Achievement>.from(
        json['achievements']?.map((e) => Achievement.fromJson(e)) ?? [],
      ),
      projects: List<Project>.from(
        json['projects']?.map((e) => Project.fromJson(e)) ?? [],
      ),
    );
  }
}
