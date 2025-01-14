import 'package:flutter/material.dart';
import 'package:nursery_app/constants.dart';
import 'package:nursery_app/core/widgets/custom_frame_container.dart';

class CreateAnimatedDialog extends StatelessWidget {
  const CreateAnimatedDialog(
      {super.key,
      required this.dialogBody,
      this.backgroundColor = kSecondaryColor});
  final Widget dialogBody;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: size.height * 0.76,
          maxWidth: size.width * 0.8,
        ),
        child: CustomFrameContainer(
          backgroundColor: backgroundColor,
          margin: EdgeInsets.zero,
          child: dialogBody,
        ),
      ),
    );
  }
}
