// CV Data Model
class PersonalInfo {
  final String name;
  final String email;
  final String phone;
  final String location;
  final String position;
  final String summary;
  final String profileImage;
  final String linkedin;
  final String github;

  PersonalInfo({
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.position,
    required this.summary,
    required this.profileImage,
    this.linkedin = '',
    this.github = '',
  });
}

class Experience {
  final String company;
  final String position;
  final String location;
  final String startDate;
  final String endDate;
  final String description;
  final bool isCurrent;

  Experience({
    required this.company,
    required this.position,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.description,
    this.isCurrent = false,
  });
}

class Education {
  final String institution;
  final String degree;
  final String fieldOfStudy;
  final String startDate;
  final String endDate;
  final String description;
  final double gpa;

  Education({
    required this.institution,
    required this.degree,
    required this.fieldOfStudy,
    required this.startDate,
    required this.endDate,
    this.description = '',
    this.gpa = 0.0,
  });
}

class Skill {
  final String name;
  final String category;
  final int level; // 1-5

  Skill({
    required this.name,
    required this.category,
    required this.level,
  });
}

class CVData {
  final PersonalInfo personalInfo;
  final List<Experience> experiences;
  final List<Education> educations;
  final List<Skill> skills;
  final List<String> languages;
  final List<String> certifications;

  CVData({
    required this.personalInfo,
    required this.experiences,
    required this.educations,
    required this.skills,
    this.languages = const [],
    this.certifications = const [],
  });
}
