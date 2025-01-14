import 'package:flutter/material.dart';

abstract class AppFuctions {
  static Future<void> createGeneralDialog(BuildContext context,
      {required String barrierLabel, required Widget dialogWidget}) async {
    await showGeneralDialog(
      useRootNavigator: true,
      transitionDuration: const Duration(milliseconds: 500),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        Tween<Offset> animtionDialog =
            Tween(begin: const Offset(0, -1), end: const Offset(0, 0));
        return SlideTransition(
          position: animtionDialog.animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOutCubicEmphasized,
            ),
          ),
          child: child,
        );
      },
      barrierDismissible: true,
      barrierLabel: barrierLabel,
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return dialogWidget;
      },
    );
  }
}
