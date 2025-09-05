import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/home_page.dart';
//import '../features/login/login_page.dart';
//import '../features/settings/settings_page.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    /*
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    */
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
