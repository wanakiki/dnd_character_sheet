import 'package:isar/isar.dart';
import '../lib/app/data/spell.dart'; // Ensure this imports your Spell model
import 'dart:io';

Future<void> main() async {
  final isar = await Isar.open([SpellSchema], directory: './isar_db');

  final spells = <Spell>[
    Spell()
      ..name = 'Fireball'
      ..school = 'Evocation'
      ..level = '3'
      ..castingTime = '1 action'
      ..range = '150 feet'
      ..materialComponents = 'V, S, M'
      ..duration = 'Instantaneous'
      ..description = 'A bright streak flashes from your pointing finger...'
      ..classes = ['Wizard', 'Sorcerer'],
    // Add more spells here
  ];

  await isar.writeTxn(() async {
    await isar.spells.putAll(spells);
  });

  print('Database populated!');
  await isar.close();
}
