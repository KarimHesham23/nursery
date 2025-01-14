import 'package:flutter/material.dart';

import 'package:nursery_app/core/utils/assets.dart';
import 'package:nursery_app/core/utils/styles.dart';
import 'package:nursery_app/features/start/presentation/views/widgets/animation_button.dart';

class StartViewBody extends StatelessWidget {
  const StartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetsApp.appIcon,
                      height:
                          screenHeight * 0.4, // Adjust these values as needed
                      width: screenWidth * 0.8,
                    ),
                    Text(
                      "InfantSense",
                      style: Styles.logoTextSyle.copyWith(
                        fontSize: screenHeight * 0.06, // Adjust the font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Navigate your baby's health with ease. Gentle, reliable insights for brighter beginnings",
                      style: Styles.styleText14,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    AnimatedButton(width: screenWidth * 0.85),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
