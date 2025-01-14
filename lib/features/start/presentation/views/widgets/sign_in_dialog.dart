import 'package:flutter/material.dart';

import 'package:nursery_app/constants.dart';

class SignInDialog extends StatelessWidget {
  const SignInDialog({super.key, required this.body});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.78,
          margin: EdgeInsets.only(
            right: 18,
            left: 18,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: kPrimaryColor.withOpacity(0.97),
            boxShadow: [
              BoxShadow(
                color:
                    kSpecialColor.withOpacity(0.5), // Shadow color and opacity
                spreadRadius: 5, // Spread radius
                blurRadius: 10, // Blur radius
                offset: const Offset(0, 3), // Offset from top left
              ),
            ],
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: body,
          ),
        ),
      ),
    );
  }
}
