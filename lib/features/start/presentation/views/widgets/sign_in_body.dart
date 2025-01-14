import 'package:flutter/material.dart';

import 'package:nursery_app/core/utils/styles.dart';
import 'package:nursery_app/features/start/presentation/views/widgets/sign_in_form.dart';

class SginInBody extends StatelessWidget {
  const SginInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Text(
            "Sign In",
            style: Styles.logoTextSyle.copyWith(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(
            child: SginInForm(),
          ),
        ],
      ),
    );
  }
}
