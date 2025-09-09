import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/home_page.dart';
import '../features/login/login_page.dart';
import '../services/auth_provider.dart';
//import '../features/settings/settings_page.dart';

final router = GoRouter(
  initialLocation: getInitialRoute(),
  routes: [
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomePage(),
      /*
      routes: [
        GoRoute(
          path: 'settings', // becomes /home/settings
          name: 'settings',
          builder: (context, state) => const SettingsPage(),
        ),
      ],
      */
    ),
  ],
);

String getInitialRoute() {
  bool isLoggedIn = AuthService().isUserLoggedIn();
  return isLoggedIn ? '/home' : '/login';
}