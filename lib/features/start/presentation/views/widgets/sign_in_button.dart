import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nursery_app/constants.dart';

import 'package:nursery_app/core/utils/styles.dart';

class SginInButton extends StatelessWidget {
  const SginInButton(
      {super.key,
      required this.onPressed,
      required this.textContent,
      required this.load});
  final VoidCallback onPressed;
  final String textContent;
  final bool load;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: load
          ? Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                color: kSpecialColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              ),
            )
          : ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kSpecialColor,
                  minimumSize: const Size(double.infinity, 56),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ))),
              onPressed: onPressed,
              icon: const Icon(
                FontAwesomeIcons.arrowRight,
                color: Colors.white,
              ),
              label: Text(
                textContent,
                style: Styles.styleText16,
              ),
            ),
    );
  }
}
