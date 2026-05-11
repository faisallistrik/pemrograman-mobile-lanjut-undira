// Education Screen
import 'package:flutter/material.dart';
import 'package:uts_curriculum_vitae/data/sample_cv_data.dart';
import 'package:uts_curriculum_vitae/widgets/custom_widgets.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Education'),
        elevation: 0,
      ),
      body: ListView(
        children: [
          SectionHeader(
            title: 'Education',
            icon: Icons.school_outlined,
          ),
          ...cvData.educations.map((edu) {
            return EducationCard(
              institution: edu.institution,
              degree: edu.degree,
              fieldOfStudy: edu.fieldOfStudy,
              startDate: edu.startDate,
              endDate: edu.endDate,
              description: edu.description,
              gpa: edu.gpa,
            );
          }).toList(),
          if (cvData.certifications.isNotEmpty) ...[
            SectionHeader(
              title: 'Certifications',
              icon: Icons.card_membership_outlined,
            ),
            ...cvData.certifications.map((cert) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.amber[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.verified,
                          color: Colors.amber[800],
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          cert,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
