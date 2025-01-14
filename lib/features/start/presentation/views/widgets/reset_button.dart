import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:nursery_app/constants.dart';
import 'package:nursery_app/core/utils/styles.dart';

class RestButton extends StatelessWidget {
  const RestButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        minimumSize: const Size(double.infinity, 56),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: kSpecialColor),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      onPressed: onPressed,
      icon: const Icon(
        FontAwesomeIcons.rotateLeft,
        color: Colors.white,
      ),
      label: Text(
        "Reset",
        style: Styles.styleText16,
      ),
    );
  }
}
