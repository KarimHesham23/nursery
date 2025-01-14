import 'package:flutter/material.dart';
import 'package:nursery_app/features/home/views/widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = "home view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
    );
  }
}
