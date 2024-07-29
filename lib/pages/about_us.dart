import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.05;

    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
              decoration: BoxDecoration(
                color: Colors.teal[50],
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'About Us',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              'Welcome to Our Company!',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: size.height * 0.01),
            const Text(
              'We are dedicated to providing the best quality products and services to our customers. Our mission is to make shopping easy, accessible, and enjoyable for everyone.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: size.height * 0.03),
            _buildSectionHeader('Mission'),
            const Text(
              'Our mission is to create a seamless shopping experience by offering a wide range of high-quality products, exceptional customer service, and a user-friendly online platform.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: size.height * 0.03),
            _buildSectionHeader('Contact Us'),
            const Text(
              'If you have any questions or need assistance, please feel free to contact us:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: size.height * 0.01),
            _buildContactInfo(Icons.email, 'support@company.com'),
            _buildContactInfo(Icons.phone, '+1 (123) 456-7890'),
            SizedBox(height: size.height * 0.03),
            _buildSectionHeader('Our Team'),
            SizedBox(height: size.height * 0.01),
            _buildTeamMember(
              'John Doe',
              'CEO & Founder',
              'assets/photo1.png',
            ),
            SizedBox(height: size.height * 0.01),
            _buildTeamMember(
              'Jane Smith',
              'Chief Marketing Officer',
              'assets/photo2.png',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.teal),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, color: Colors.teal),
          ),
        ),
      ],
    );
  }

  Widget _buildTeamMember(String name, String role, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 30,
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          role,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
