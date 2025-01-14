import 'package:flutter/material.dart';
import 'package:nursery_app/features/start/presentation/views/widgets/start_view_body.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});
  static String id = "Start View";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StartViewBody(),
    );
  }
}
