import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nursery_app/core/utils/assets.dart';
import 'package:nursery_app/core/utils/styles.dart';
import 'package:nursery_app/features/start/presentation/views/start_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    initialScaleAnimation();
    navigateToStart();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        const Spacer(),
        ScaleTransition(
          scale: _scaleAnimation,
          child: Image.asset(
            AssetsApp.appIcon,
            height: screenHeight * 0.4, // Adjust these values as needed
            width: screenWidth * 0.8,
          ),
        ),
        ScaleTransition(
          scale: _scaleAnimation,
          child: Text(
            "InfantSense",
            style: Styles.logoTextSyle.copyWith(
              fontSize: screenHeight * 0.06, // Adjust the font size
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ScaleTransition(
          scale: _scaleAnimation,
          child: Text(
            "Smart Monitoring for a Healthier Tomorrow.",
            style: Styles.logoTextSyle.copyWith(
              fontSize: screenHeight * 0.02,
            ),
          ),
        ),
        const Spacer(),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }

  void initialScaleAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    Future.delayed(
      const Duration(seconds: 1),
      () {
        _controller.forward();
      },
    );
  }

  void navigateToStart() {
    Future.delayed(const Duration(seconds: 4), () {
      context.goNamed(StartView.id);
    });
  }
}
