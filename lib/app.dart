import 'package:flutter/material.dart';
import 'router/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Router Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
