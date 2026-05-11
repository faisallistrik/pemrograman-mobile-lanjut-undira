// Contact Screen
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uts_curriculum_vitae/data/sample_cv_data.dart';
import 'package:uts_curriculum_vitae/widgets/custom_widgets.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  void _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  void _sendEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': 'Hello from CV App',
      },
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final info = cvData.personalInfo;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
        elevation: 0,
      ),
      body: ListView(
        children: [
          SectionHeader(
            title: 'Get in Touch',
            icon: Icons.contact_mail_outlined,
          ),
          const SizedBox(height: 24),
          // Contact Options
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Email
                _buildContactCard(
                  icon: Icons.email,
                  iconColor: Colors.red,
                  title: 'Email',
                  value: info.email,
                  onTap: () => _sendEmail(info.email),
                ),
                const SizedBox(height: 12),

                // Phone
                _buildContactCard(
                  icon: Icons.phone,
                  iconColor: Colors.green,
                  title: 'Phone',
                  value: info.phone,
                  onTap: () => _makePhoneCall(info.phone),
                ),
                const SizedBox(height: 12),

                // Location
                _buildContactCard(
                  icon: Icons.location_on,
                  iconColor: Colors.blue,
                  title: 'Location',
                  value: info.location,
                  onTap: null,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Social Media Links
          if (info.linkedin.isNotEmpty || info.github.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Follow Me',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      if (info.linkedin.isNotEmpty)
                        Expanded(
                          child: _buildSocialButton(
                            icon: FontAwesomeIcons.linkedin,
                            label: 'LinkedIn',
                            color: Colors.blue,
                            onTap: () => _launchURL(info.linkedin),
                          ),
                        ),
                      if (info.linkedin.isNotEmpty && info.github.isNotEmpty)
                        const SizedBox(width: 12),
                      if (info.github.isNotEmpty)
                        Expanded(
                          child: _buildSocialButton(
                            icon: FontAwesomeIcons.github,
                            label: 'GitHub',
                            color: Colors.black,
                            onTap: () => _launchURL(info.github),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          const SizedBox(height: 32),

          // Quick Message Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Quick Message',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Interested in working together?',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Feel free to reach out to me via email or phone. I\'m always open to discussing new projects, creative ideas, or opportunities.',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () => _sendEmail(info.email),
                          icon: const Icon(Icons.send),
                          label: const Text('Send Email'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
    required VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: iconColor.withAlpha(38),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            if (onTap != null)
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey[400],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: color.withAlpha(31),
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
