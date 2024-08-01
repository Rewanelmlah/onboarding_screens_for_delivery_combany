import 'package:flutter/material.dart';
import 'package:iti_first/onboarding.dart';

void main() {
  runApp(const onboardingscreens());
}

class onboardingscreens extends StatelessWidget {
  const onboardingscreens({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
    );
  }
}
