import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quantum_care/screens/login_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnimatedSplashScreen(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      splashIconSize: size.height * 0.5,
      duration: 3000,

      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _SplashAnimation(size: size),
          const SizedBox(height: 24),
          const _AppTitle(),
        ],
      ),

      nextScreen: const LoginPage(),
    );
  }
}

class _SplashAnimation extends StatelessWidget {
  final Size size;

  const _SplashAnimation({required this.size});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'lib/animations/Health.json',
      width: size.width * 0.6,
      height: size.width * 0.6,
      fit: BoxFit.contain,
    );
  }
}

class _AppTitle extends StatelessWidget {
  const _AppTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      "Quantum Care",
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.0,
      ),
    );
  }
}
