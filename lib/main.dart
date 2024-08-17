import 'package:flutter/material.dart';
import 'package:dnd_character/app/pages/home_page.dart';
import 'package:dnd_character/app/data/character_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CharacterManager(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'D&D Character Display',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CharacterDisplayScreen(),
    );
  }
}
