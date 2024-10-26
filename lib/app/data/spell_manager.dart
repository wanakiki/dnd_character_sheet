import 'package:isar/isar.dart';
import 'spell.dart';

class SpellManager {
  final Isar isar;

  SpellManager({required this.isar});

  Future<void> importSpells(List<Map<String, dynamic>> jsonData) async {
    await isar.writeTxn(() async {
      await isar.spells.importJson(jsonData);
    });
  }

  Future<List<Spell>> getAllSpells() async {
    return await isar.spells.where().findAll();
  }
}
