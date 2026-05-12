// Experience Screen
import 'package:flutter/material.dart';
import 'package:uts_curriculum_vitae/data/sample_cv_data.dart';
import 'package:uts_curriculum_vitae/widgets/custom_widgets.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Work Experience'),
        elevation: 0,
      ),
      body: ListView(
        children: [
          const SectionHeader(
            title: 'Professional Experience',
            icon: Icons.work_outline,
          ),
          ...cvData.experiences.map((exp) => ExperienceCard(
              company: exp.company,
              position: exp.position,
              location: exp.location,
              startDate: exp.startDate,
              endDate: exp.endDate,
              description: exp.description,
              isCurrent: exp.isCurrent,
            )),
          const SizedBox(height: 16),
        ],
      ),
    );
}
