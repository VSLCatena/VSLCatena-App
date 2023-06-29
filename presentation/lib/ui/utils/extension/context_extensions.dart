import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension BuildContextExtensions on BuildContext {
  void navigateTo(String destination) {
    GoRouter.of(this).push(destination);
  }

  void topNavigateTo(String destination) {
    GoRouter.of(this).go(destination);
  }
}
