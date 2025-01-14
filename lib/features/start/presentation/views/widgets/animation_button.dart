import 'package:flutter/material.dart';
import 'package:nursery_app/constants.dart';
import 'package:nursery_app/core/helpers/functions.dart';
import 'package:nursery_app/core/utils/styles.dart';
import 'package:nursery_app/features/start/presentation/views/widgets/sign_in_body.dart';
import 'package:nursery_app/features/start/presentation/views/widgets/sign_in_dialog.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key, required this.width});
  final double width;

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controllerButton;
  late Animation _animationButton;
  late Animation<double> _curveButton;
  @override
  void initState() {
    initalAnimation();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AnimatedButton oldWidget) {
    _animationButton =
        Tween(begin: 0.0, end: widget.width).animate(_curveButton);

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controllerButton.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _animationButton,
          builder: (context, child) => Container(
            width: _animationButton.value,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kSpecialColor,
              gradient: const LinearGradient(
                colors: [
                  kSpecialColor,
                  Colors.white,
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            signIn(context);
          },
          child: Container(
            width: widget.width,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              border: Border.all(
                color: kSpecialColor,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.arrow_forward,
                    size: 24,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    "start",
                    style: Styles.logoTextSyle,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  void signIn(BuildContext context) {
    _controllerButton.forward();

    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        AppFuctions.createGeneralDialog(context,
            barrierLabel: "Sign In",
            dialogWidget: SignInDialog(
              body: SginInBody(),
            ));
      },
    );
    Future.delayed(
      const Duration(
        milliseconds: 1000,
      ),
      () {
        _controllerButton.reverse();
      },
    );
  }

  void initalAnimation() {
    _controllerButton = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _curveButton =
        CurvedAnimation(parent: _controllerButton, curve: Curves.easeInCubic);
    _animationButton =
        Tween(begin: 0.0, end: widget.width).animate(_curveButton);
  }
}
