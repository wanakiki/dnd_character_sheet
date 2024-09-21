import 'package:flutter/foundation.dart';
// import 'package:hive/hive.dart';
import 'package:dnd_character/app/data/character.dart';
import 'diceset.dart';
import 'items.dart';

class CharacterManager extends ChangeNotifier {
  // final Box<Character> _box;
  late Character _character;

  CharacterManager() {
    _character = Character.empty();
  }

  // Update the character with the new character
  void updateCharacter(Character newCharacter) {
    _character = newCharacter;
    notifyListeners();
  }

  // Update the character attributes with the new attributes
  void updateAttribute(String type, int value) {
    _character.attributes[type] = value;
    notifyListeners();
  }

  // Delete the target diceSet from the diceBag, input is the diceSet name
  void deleteDiceSet(String diceSetName) {
    _character.diceBag.removeWhere((diceSet) => diceSet.name == diceSetName);
    notifyListeners();
  }

  // Add a diceSet to the diceBag
  void addDiceSet(DiceSet diceSet) {
    _character.diceBag.add(diceSet);
    notifyListeners();
  }

  // 添加物品到角色的背包
  void addItem(Item item) {
    _character.backpack.add(item);
    notifyListeners();
  }

  // 根据 uniqueId 删除物品
  void deleteItem(String uniqueId) {
    _character.backpack.removeWhere((item) => item.uniqueId == uniqueId);
    notifyListeners();
  }

  // CharacterManager(this._box) {
  //   // Load character when the manager is created
  //   _loadCharacter();
  // }

  // Character get character => _character;

  // Future<void> _loadCharacter() async {
  //   // Load character from the database or use a default empty character
  //   _character = _box.get('character_key') ?? Character.empty();
  //   notifyListeners();
  // }

  // Future<void> saveCharacter() async {
  //   // Save the character to the database
  //   await _box.put('character_key', _character);
  // }

  // void updateCharacter(Character newCharacter) {
  //   _character = newCharacter;
  //   notifyListeners();
  // }

  // Future<void> deleteCharacter() async {
  //   // Delete the character from the database
  //   await _box.delete('character_key');
  //   _character = Character.empty();
  //   notifyListeners();
  // }

  Character get character => _character;
}
