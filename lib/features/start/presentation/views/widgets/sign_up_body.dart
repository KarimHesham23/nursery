import 'package:flutter/material.dart';

import 'package:nursery_app/core/utils/styles.dart';
import 'package:nursery_app/features/start/presentation/views/widgets/sign_up_form.dart';

class SginUpBody extends StatelessWidget {
  const SginUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Text(
            "Sign Up",
            style: Styles.logoTextSyle.copyWith(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(
            child: SginUpForm(),
          ),
        ],
      ),
    );
  }
}
