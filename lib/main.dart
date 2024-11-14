import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'app/pages/home_page.dart';
import 'app/data/spell.dart';
import 'app/data/character_manager.dart';
import 'app/data/character.dart';
import 'app/pages/switch_character_page.dart';
import 'app/pages/setting_page.dart';
import 'app/pages/about_page.dart';

import 'streaming_asr/main.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isar = await initializeDatabase();
  // runApp(
  //   MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(
  //           create: (context) => CharacterManager(isar: isar)),
  //       Provider<Isar>.value(value: isar), // Provide the Isar instance
  //     ],
  //     child: MyApp(),
  //   ),
  // );
  runApp(MyApp_asr());
}

Future<Isar> initializeDatabase() async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [SpellSchema, CharacterSchema], // Include all necessary schemas
    directory: dir.path,
  );

  // Check if the database is empty
  final existingSpells = await isar.spells.where().findAll();
  if (existingSpells.isEmpty) {
    // Import JSON data if the database is empty
    final jsonString = await rootBundle.loadString('assets/spells.json');
    final List<Map<String, dynamic>> jsonData =
        List<Map<String, dynamic>>.from(json.decode(jsonString));

    await isar.writeTxn(() async {
      await isar.spells.importJson(jsonData);
    });
  }

  return isar;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'D&D Character Display',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => CharacterDisplayScreen(),
        '/switch_character': (context) => SwitchCharacterScreen(),
        '/setting': (context) => SettingsPage(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}
