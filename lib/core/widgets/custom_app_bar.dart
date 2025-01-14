import 'package:flutter/material.dart';
import 'package:nursery_app/core/utils/styles.dart';
import 'package:nursery_app/core/widgets/custom_frame_app_bar.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.kName});
  final String kName;
  @override
  Widget build(BuildContext context) {
    return CustomFrameAppBar(
        child: Row(
      children: [
        const SizedBox(
          width: 12,
        ),
        Text(
          "Hello $kName",
          style: Styles.styleText16,
        ),
      ],
    ));
  }
}
