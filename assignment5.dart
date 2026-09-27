import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile UI',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors matching the UI design
    const Color headerColor = Color(0xFFF1B80A);
    const Color bodyBgColor = Color(0xFFFAF4FF);
    const Color circleBgColor = Color(0xFFEADBFF);
    const Color iconColor = Color(0xFF2E0066);
    const Color textColor = Color(0xFF1A1A1A);

    return Scaffold(
      backgroundColor: bodyBgColor,
      appBar: AppBar(
        backgroundColor: headerColor,
        elevation: 0,
        // Added shape property to round the bottom corners of the AppBar
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.0),
            topRight: Radius.circular(22.0),
          ),
        ),
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: textColor),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: textColor),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.phone, color: textColor),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Top Feature Item: Ice Cream
            ProfileFeatureWidget(
              circleBgColor: circleBgColor,
              textColor: textColor,
              icon: Icon(
                Icons.icecream_outlined,
                size: 60,
                color: iconColor,
              ),
              message: 'Ice cream is very delicious, right?',
            ),

            // Bottom Feature Item: Programming
            ProfileFeatureWidget(
              circleBgColor: circleBgColor,
              textColor: textColor,
              icon: Icon(
                Icons.code,
                size: 60,
                color: iconColor,
              ),
              message: 'Programming is not boring if you love it.',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileFeatureWidget extends StatelessWidget {
  final Color circleBgColor;
  final Color textColor;
  final Widget icon;
  final String message;

  const ProfileFeatureWidget({
    super.key,
    required this.circleBgColor,
    required this.textColor,
    required this.icon,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: circleBgColor,
            shape: BoxShape.circle,
          ),
          child: Center(child: icon),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ],
    );
  }
}
