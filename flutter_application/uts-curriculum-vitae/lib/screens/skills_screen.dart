// Skills Screen
import 'package:flutter/material.dart';
import 'package:uts_curriculum_vitae/data/sample_cv_data.dart';
import 'package:uts_curriculum_vitae/widgets/custom_widgets.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Group skills by category
    final Map<String, List<dynamic>> skillsByCategory = {};
    for (var skill in cvData.skills) {
      if (!skillsByCategory.containsKey(skill.category)) {
        skillsByCategory[skill.category] = [];
      }
      skillsByCategory[skill.category]!.add(skill);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Skills'),
        elevation: 0,
      ),
      body: ListView(
        children: [
          SectionHeader(
            title: 'Professional Skills',
            icon: Icons.star_outline,
          ),
          ...skillsByCategory.entries.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      entry.key,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    children: entry.value.map((skill) {
                      return SkillBadge(
                        name: skill.name,
                        level: skill.level,
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          }).toList(),
          const SizedBox(height: 24),
          // Skills Summary
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Skill Levels',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                _buildSkillLevelInfo('Expert', 5, Colors.green),
                _buildSkillLevelInfo('Advanced', 4, Colors.blue),
                _buildSkillLevelInfo('Intermediate', 3, Colors.amber),
                _buildSkillLevelInfo('Beginner', 1, Colors.grey),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSkillLevelInfo(String label, int level, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ...List.generate(5, (index) {
            return Icon(
              Icons.star,
              size: 16,
              color: index < level ? color : Colors.grey[300],
            );
          }),
          const SizedBox(width: 16),
          Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
