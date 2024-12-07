import 'package:dnd_character/app/setting/app_pref.dart';
import 'package:flutter/foundation.dart';
import 'package:dnd_character/app/data/character.dart';
import 'diceset.dart';
import 'items.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'expertise_item.dart';
import 'consumable.dart';

class CharacterManager extends ChangeNotifier {
  late Character _character;
  final Isar isar;
  final AppPreferences appPrefs;

  CharacterManager({required this.isar, required this.appPrefs}) {
    _character = Character.empty();
    _loadCharacter();
  }

  // Future<void> _loadCharacter() async {
  //   final character = await isar.characters.get(1);
  //   if (character != null) {
  //     _character = character;
  //   } else {
  //     _saveCharacter();
  //   }
  //   notifyListeners();
  // }

  Future<void> _loadCharacter() async {
    final lastCharacterId = appPrefs.getLastCharacterId();
    if (lastCharacterId != null) {
      final character = await await isar.characters.get(lastCharacterId);
      if (character != null) {
        _character = character;
      } else {
        _saveCharacter();
      }
    } else {
      _saveCharacter();
    }
    notifyListeners();
  }

  // 更新角色
  // void updateCharacter(Character newCharacter) {
  //   // 使用新角色替换旧角色，修改内容
  //   _character = newCharacter;
  //   notifyListeners();
  //   _saveCharacter();
  // }
  // 更新角色属性 传入字典
  void updateCharacter(Map<String, dynamic> attribute) {
    // 使用新角色替换旧角色，修改内容6
    if (attribute.containsKey('name')) {
      _character.name = attribute['name'];
    }
    if (attribute.containsKey('race')) {
      _character.race = attribute['race'];
    }
    if (attribute.containsKey('characterClass')) {
      _character.characterClass = attribute['characterClass'];
    }
    if (attribute.containsKey('background')) {
      _character.background = attribute['background'];
    }
    if (attribute.containsKey('alignment')) {
      _character.alignment = attribute['alignment'];
    }
    if (attribute.containsKey('level')) {
      _character.level = attribute['level'];
    }
    if (attribute.containsKey('experiencePoints')) {
      _character.experiencePoints = attribute['experiencePoints'];
    }
    if (attribute.containsKey('attributes')) {
      _character.attributes = attribute['attributes'];
    }
    if (attribute.containsKey('currentHitPoints')) {
      _character.currentHitPoints = attribute['currentHitPoints'];
    }
    if (attribute.containsKey('maxHitPoints')) {
      _character.maxHitPoints = attribute['maxHitPoints'];
    }
    if (attribute.containsKey('armorClass')) {
      _character.armorClass = attribute['armorClass'];
    }
    if (attribute.containsKey('initiative')) {
      _character.initiative = attribute['initiative'];
    }
    if (attribute.containsKey('speed')) {
      _character.speed = attribute['speed'];
    }
    if (attribute.containsKey('coin')) {
      _character.coin = attribute['coin'];
    }
    if (attribute.containsKey('avatarUrl')) {
      _character.avatarUrl = attribute['avatarUrl'];
    }
    if (attribute.containsKey('diceBag')) {
      _character.diceBag = attribute['diceBag'];
    }
    if (attribute.containsKey('backpack')) {
      _character.backpack = attribute['backpack'];
    }
    if (attribute.containsKey('temporaryHitPoints')) {
      _character.temporaryHitPoints = attribute['temporaryHitPoints'];
    }
    if (attribute.containsKey('skills')) {
      _character.skills = attribute['skills'];
    }
    notifyListeners();
    _saveCharacter();
  }

  // 更新角色属性
  void updateAttribute(String type, int value) {
    switch (type) {
      case '力量':
        _character.attributes[0] = value;
        break;
      case '敏捷':
        _character.attributes[1] = value;
        break;
      case '体质':
        _character.attributes[2] = value;
        break;
      case '智力':
        _character.attributes[3] = value;
        break;
      case '感知':
        _character.attributes[4] = value;
        break;
      case '魅力':
        _character.attributes[5] = value;
        break;
    }
    notifyListeners();
    _saveCharacter();
  }

  // 从骰子袋中删除指定名称的骰子集
  void deleteDiceSet(String diceSetName) {
    // Convert the fixed-length list to a growable list
    _character.diceBag = List.from(_character.diceBag);

    _character.diceBag.removeWhere((diceSet) => diceSet.name == diceSetName);
    notifyListeners();
    _saveCharacter();
  }

  // 向骰子袋中添加骰子集
  void addDiceSet(DiceSet diceSet) {
    _character.diceBag = [..._character.diceBag, diceSet];
    notifyListeners();
    _saveCharacter();
  }

  // 向角色的背包中添加物品
  void addItem(Item item) {
    _character.backpack = [..._character.backpack, item];
    notifyListeners();
    _saveCharacter();
  }

  // 根据uniqueId删除物品
  void deleteItem(String uniqueId) {
    _character.backpack.removeWhere((item) => item.uniqueId == uniqueId);
    notifyListeners();
    _saveCharacter();
  }

  // 保存角色到数据库
  Future<void> _saveCharacter() async {
    await isar.writeTxn(() async {
      await isar.characters.put(_character);
    });
  }

  // Add a skill to the character
  void addSkill(String skill) {
    _character.skills = [..._character.skills, skill];
    notifyListeners();
    _saveCharacter();
  }

// Delete a skill from the character
  void deleteSkill(String skill) {
    _character.skills.remove(skill);
    notifyListeners();
    _saveCharacter();
  }

// Add an expertise to the character
  void addExpertise(ExpertiseItem expertise) {
    _character.expertise = [..._character.expertise, expertise];
    notifyListeners();
    _saveCharacter();
  }

// Delete an expertise from the character
  void deleteExpertise(String expertiseName) {
    _character.expertise.removeWhere((exp) => exp.name == expertiseName);
    notifyListeners();
    _saveCharacter();
  }

  // 更新物品数量
  void updateItemQuantity(Item item, int newQuantity) {
    item.quantity = newQuantity;
    notifyListeners();
    _saveCharacter();
  }

  //更新物品信息
  void updateItem(Item item) {
    _character.backpack = [..._character.backpack, item];
    notifyListeners();
    _saveCharacter();
  }

  Character get character => _character;

  void addFavoriteSpell(String spellName) {
    if (!_character.favoriteSpells.contains(spellName)) {
      _character.favoriteSpells = [..._character.favoriteSpells, spellName];
      notifyListeners();
      _saveCharacter();
    }
  }

  void removeFavoriteSpell(String spellName) {
    if (_character.favoriteSpells.contains(spellName)) {
      _character.favoriteSpells.remove(spellName);
      notifyListeners();
      _saveCharacter();
    }
  }

  Future<List<Character>> fetchAllCharacters() async {
    return await isar.characters.where().findAll();
  }

  Future<void> deleteCharacter(int characterId) async {
    if (_character.id == characterId) {
      await isar.writeTxn(() async {
        await isar.characters.delete(characterId);
      });
      final allCharacters = await fetchAllCharacters();
      if (allCharacters.isNotEmpty) {
        setCurrentCharacter(allCharacters.first);
      } else {
        setCurrentCharacter(Character.empty());
        _saveCharacter();
      }
    } else {
      await isar.writeTxn(() async {
        await isar.characters.delete(characterId);
      });
    }
    notifyListeners();
  }

  Future<void> setCurrentCharacter(Character character) async {
    _character = character;
    await appPrefs.saveLastCharacterId(_character.id);
    notifyListeners();
  }

  Future<void> addCharacter(Character character) async {
    await isar.writeTxn(() async {
      await isar.characters.put(character);
    });
    notifyListeners();
  }

  void addConsumable(Consumable consumable) {
    _character.consumables.add(consumable);
    notifyListeners();
    _saveCharacter();
  }

  void updateConsumable(Consumable consumable) {
    // Find and update the consumable
    final index =
        _character.consumables.indexWhere((c) => c.name == consumable.name);
    if (index != -1) {
      _character.consumables[index] = consumable;
      notifyListeners();
      _saveCharacter();
    }
  }

  void removeConsumable(String name) {
    _character.consumables.removeWhere((c) => c.name == name);
    notifyListeners();
    _saveCharacter();
  }

  void triggerShortRest() {
    for (var consumable in _character.consumables) {
      consumable.recoverShortRest();
    }
    notifyListeners();
    _saveCharacter();
  }

  void triggerLongRest() {
    for (var consumable in _character.consumables) {
      consumable.recoverLongRest();
    }
    notifyListeners();
    _saveCharacter();
  }

  void updateBackpackOrder(List<Item> newOrder) {
    _character.backpack = newOrder;
    notifyListeners();
    _saveCharacter();
  }
}
