import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marvel_api_flutter_app/screen/marvel_home.dart';

void main() {
  runApp(MarvelApp());
}

class MarvelApp extends StatelessWidget {
  MarvelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _route,
    );
  }

  final GoRouter _route = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MarvelHomeScreen()
    ),
  ]);
}
