import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to the COVID-19 Tracker App!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Our Mission',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'At COVID-19 Tracker, our mission is to provide users with real-time data and insights about the COVID-19 pandemic. We believe that access to accurate and timely information is essential for making informed decisions and staying safe during these challenging times.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Who We Are',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'We are a dedicated team of developers, health enthusiasts, and data analysts who came together to create a comprehensive tool that empowers individuals and communities. Our goal is to simplify the process of tracking COVID-19 statistics, including cases, recoveries, and vaccinations, in a user-friendly and intuitive app.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'What We Offer',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '• Real-Time Data: Get up-to-date information on COVID-19 cases, deaths, and recoveries at both global and country levels.'),
                    Text(
                        '• Interactive Maps: Visualize the spread of the virus through interactive maps and graphs.'),
                    Text(
                        '• Preventive Information: Access guidelines and tips from health organizations to help you stay safe.'),
                    Text(
                        '• User-Friendly Interface: Navigate seamlessly through the app with a clean and simple design.'),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Our Commitment',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'We are committed to providing accurate and reliable information sourced from reputable health organizations and government agencies. Our team continuously monitors updates to ensure that our data reflects the current situation.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Join Us',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Stay informed, stay safe, and help us spread awareness about COVID-19. Together, we can navigate this pandemic with knowledge and resilience.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Thank you for choosing COVID-19 Tracker. Your health and safety are our top priorities.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
