import 'package:flutter/material.dart';
import 'models/resume_data.dart';
import 'screens/resume_screen.dart';

void main() {
  runApp(const ResumeApp());
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Professional Resume',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto', // Clean, professional font
      ),
      home: ResumeScreen(resume: _sampleResume),
    );
  }
}

final _sampleResume = ResumeData(
  personalInfo: const PersonalInfo(
    fullName: 'Jane Doe',
    email: 'jane.doe@email.com',
    phone: '(555) 123-4567',
    location: 'San Francisco, CA',
    linkedIn: 'linkedin.com/in/janedoe',
  ),
  summary:
      'Results-driven Software Engineer with 5+ years of experience in developing scalable web and mobile applications. Proven expertise in Flutter, Dart, and cloud technologies. Adept at leading cross-functional teams to deliver high-quality software solutions on time and within budget. Passionate about writing clean, maintainable code and building intuitive user experiences.',
  experience: [
    const Experience(
      jobTitle: 'Senior Mobile Engineer',
      company: 'Tech Solutions Inc.',
      location: 'San Francisco, CA',
      startDate: 'Jan 2021',
      endDate: 'Present',
      responsibilities: [
        'Lead the development of the flagship mobile application using Flutter, resulting in a 40% increase in daily active users.',
        'Mentored junior developers and established code review guidelines to improve overall code quality.',
        'Integrated RESTful APIs and optimized state management using Riverpod to enhance application performance by 25%.',
        'Collaborated with design and product teams to translate complex requirements into seamless user interfaces.',
      ],
    ),
    const Experience(
      jobTitle: 'Software Developer',
      company: 'InnovateX',
      location: 'Austin, TX',
      startDate: 'Jun 2018',
      endDate: 'Dec 2020',
      responsibilities: [
        'Developed and maintained multiple cross-platform mobile apps using React Native and Flutter.',
        'Implemented automated CI/CD pipelines using GitHub Actions, reducing deployment time by 50%.',
        'Resolved critical bugs and improved application stability, achieving a crash-free rate of 99.9%.',
      ],
    ),
  ],
  education: [
    const Education(
      degree: 'Bachelor of Science in Computer Science',
      institution: 'University of Technology',
      location: 'Austin, TX',
      graduationDate: 'May 2018',
    ),
  ],
  skills: [
    'Flutter',
    'Dart',
    'React Native',
    'JavaScript',
    'TypeScript',
    'Firebase',
    'REST APIs',
    'Git',
    'CI/CD',
    'Agile Methodology',
  ],
);
