import 'package:flutter/material.dart';
import 'package:nursery_app/core/utils/styles.dart';
import 'package:nursery_app/core/widgets/custom_frame_container.dart';

class ContentData extends StatelessWidget {
  const ContentData({super.key, required this.updata, required this.downData});
  final String updata;
  final String downData;
  @override
  Widget build(BuildContext context) {
    return CustomFrameContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(updata, style: Styles.styleText18),
            Text(downData, style: Styles.styleText16),
          ],
        ),
      ),
    );
  }
}
