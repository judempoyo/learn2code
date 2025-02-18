import 'package:flutter/material.dart';
import 'basescreen.dart';
import 'package:url_launcher/url_launcher.dart'; // Ensure this package is added to your pubspec.yaml

class ResourcesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Resource Library',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildResourceCard(
              context,
              title: 'Online Courses',
              description:
                  'Explore a variety of online courses to enhance your skills.',
              icon: Icons.school,
              color: Colors.blue,
              url: 'https://www.coursera.org', // Sample link
            ),
            _buildResourceCard(
              context,
              title: 'YouTube Channels',
              description:
                  'Discover informative YouTube channels for tutorials and tips.',
              icon: Icons.video_library,
              color: Colors.red,
              url: 'https://www.youtube.com', // Sample link
            ),
            _buildResourceCard(
              context,
              title: 'Blogs and Articles',
              description:
                  'Read insightful blogs and articles on various topics.',
              icon: Icons.article,
              color: Colors.green,
              url: 'https://medium.com', // Sample link
            ),
            _buildResourceCard(
              context,
              title: 'Podcasts',
              description:
                  'Listen to podcasts for in-depth discussions and insights.',
              icon: Icons.audiotrack_outlined,
              color: Colors.purple,
              url: 'https://www.spotify.com', // Sample link
            ),
            _buildResourceCard(
              context,
              title: 'Webinars',
              description:
                  'Join live webinars to learn from experts in the field.',
              icon: Icons.live_tv,
              color: Colors.orange,
              url: 'https://www.eventbrite.com', // Sample link
            ),
            _buildResourceCard(
              context,
              title: 'WhatsApp Group',
              description: 'Join our WhatsApp group for community discussions.',
              icon: Icons.chat,
              color: Colors.greenAccent,
              url:
                  'https://chat.whatsapp.com/your-group-link', // Replace with your actual link
            ),
            // Add more resources here
          ],
        ),
      ),
    );
  }

  Widget _buildResourceCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required String url,
  }) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => _launchURL(url),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: color,
                child: Icon(icon, color: Colors.white),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
