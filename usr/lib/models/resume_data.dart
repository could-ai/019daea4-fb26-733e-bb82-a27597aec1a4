class ResumeData {
  final PersonalInfo personalInfo;
  final String summary;
  final List<Experience> experience;
  final List<Education> education;
  final List<String> skills;

  const ResumeData({
    required this.personalInfo,
    required this.summary,
    required this.experience,
    required this.education,
    required this.skills,
  });
}

class PersonalInfo {
  final String fullName;
  final String email;
  final String phone;
  final String location;
  final String linkedIn;

  const PersonalInfo({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.location,
    required this.linkedIn,
  });
}

class Experience {
  final String jobTitle;
  final String company;
  final String location;
  final String startDate;
  final String endDate;
  final List<String> responsibilities;

  const Experience({
    required this.jobTitle,
    required this.company,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.responsibilities,
  });
}

class Education {
  final String degree;
  final String institution;
  final String location;
  final String graduationDate;

  const Education({
    required this.degree,
    required this.institution,
    required this.location,
    required this.graduationDate,
  });
}
