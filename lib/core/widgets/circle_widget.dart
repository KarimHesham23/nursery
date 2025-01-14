import 'package:flutter/material.dart';
import 'package:nursery_app/constants.dart';
import 'package:nursery_app/core/utils/styles.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget(
      {super.key, required this.icon, required this.label, required this.data});
  final IconData icon;
  final String label;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kSecondaryColor,
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.redAccent,
              ),
              Text(
                data,
                style: Styles.styleText16,
              ),
            ],
          ),
        ),
        Text(
          label,
          style: Styles.styleText16,
        ),
      ],
    );
  }
}
