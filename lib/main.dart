import 'package:flutter/material.dart';
import 'package:marvel_api_flutter_app/screen/marvel_home.dart';

void main() {
  runApp(const MarvelApp());
}

class MarvelApp extends StatelessWidget {
  const MarvelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MarvelHomeScreen(),
    );
  }
}
