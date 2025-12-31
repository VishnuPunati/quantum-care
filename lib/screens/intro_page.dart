import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quantum_care/screens/login_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: const Color(0xFFF4F9F8), 
      splashIconSize: 350,
      duration: 3000,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [_SplashAnimation(), SizedBox(height: 24), _AppTitle()],
      ),
      nextScreen: const LoginPage(),
    );
  }
}

class _SplashAnimation extends StatelessWidget {
  const _SplashAnimation();

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'lib/animations/Health.json',
      width: 260,
      height: 260,
      fit: BoxFit.contain,
    );
  }
}

class _AppTitle extends StatelessWidget {
  const _AppTitle();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Quantum Care",
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1E3A3A), 
        letterSpacing: 1.0,
      ),
    );
  }
}
