import 'package:flutter/material.dart';
import '../models/resume_data.dart';

class ResumeScreen extends StatelessWidget {
  final ResumeData resume;

  const ResumeScreen({Key? key, required this.resume}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // A clean, print-friendly and ATS-friendly layout uses standard fonts
    // and simple single-column formatting.
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATS-Friendly Resume Template'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          margin: const EdgeInsets.symmetric(vertical: 16.0),
          padding: const EdgeInsets.all(40.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(resume.personalInfo),
                const SizedBox(height: 24),
                _buildSectionTitle('PROFESSIONAL SUMMARY'),
                _buildSummary(resume.summary),
                const SizedBox(height: 24),
                _buildSectionTitle('EXPERIENCE'),
                ...resume.experience.map((exp) => _buildExperienceItem(exp)),
                const SizedBox(height: 16),
                _buildSectionTitle('EDUCATION'),
                ...resume.education.map((edu) => _buildEducationItem(edu)),
                const SizedBox(height: 16),
                _buildSectionTitle('SKILLS'),
                _buildSkills(resume.skills),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(PersonalInfo info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          info.fullName.toUpperCase(),
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          runSpacing: 4,
          children: [
            Text(info.location),
            Text(info.phone),
            Text(info.email),
            Text(info.linkedIn),
          ],
        ),
        const SizedBox(height: 16),
        const Divider(color: Colors.black, thickness: 1.5),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
        const Divider(color: Colors.black54, thickness: 1),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildSummary(String summary) {
    return Text(
      summary,
      style: const TextStyle(fontSize: 14, height: 1.5),
    );
  }

  Widget _buildExperienceItem(Experience exp) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  exp.jobTitle,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '${exp.startDate} - ${exp.endDate}',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                exp.company,
                style: const TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                exp.location,
                style: const TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...exp.responsibilities.map((resp) => Padding(
                padding: const EdgeInsets.only(bottom: 4.0, left: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(fontSize: 14)),
                    Expanded(
                      child: Text(
                        resp,
                        style: const TextStyle(fontSize: 14, height: 1.4),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildEducationItem(Education edu) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  edu.institution,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                edu.graduationDate,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                edu.degree,
                style: const TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                edu.location,
                style: const TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkills(List<String> skills) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: skills
          .map((skill) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 6.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  skill,
                  style: const TextStyle(fontSize: 13),
                ),
              ))
          .toList(),
    );
  }
}
