import 'package:flutter/material.dart';
import 'package:nursery_app/constants.dart';
import 'package:nursery_app/core/utils/styles.dart';

void showMessage(BuildContext context, {required message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: Styles.styleText14.copyWith(
          color: Colors.white,
        ),
      ),
      duration: const Duration(seconds: 3), // Adjust the duration as needed
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: kSecondaryColor,
    ),
  );
}
