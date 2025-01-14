import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nursery_app/features/home/views/home_view.dart';
import 'package:nursery_app/features/splash/presentation/views/splash_view.dart';
import 'package:nursery_app/features/start/presentation/views/start_view.dart';

abstract class AppRoute {
  static const kSplashView = "/";
  static const kStartView = "/start_view";
  static const kHomeView = "/home_view";

  static final router = GoRouter(
    routes: [
      GoRoute(
        name: SplashView.id,
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        name: StartView.id,
        path: kStartView,
        pageBuilder: (context, state) {
          return customAnimationRoute(state, const StartView(), 1000);
        },
      ),
      GoRoute(
        name: HomeView.id,
        path: kHomeView,
        pageBuilder: (context, state) {
          return customAnimationRoute(state, const HomeView(), 500);
        },
      ),
    ],
  );
  static CustomTransitionPage<void> customAnimationRoute(
      GoRouterState state, child, int duration) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionDuration: Duration(milliseconds: duration),
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
          child: child,
        );
      },
    );
  }
}
