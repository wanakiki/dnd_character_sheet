import 'package:flutter/foundation.dart';
import 'package:dnd_character/app/data/character.dart';
import 'diceset.dart';
import 'items.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart'; // 添加此行以导入所需的库

class CharacterManager extends ChangeNotifier {
  late Character _character;
  late final Isar isar;

  CharacterManager() {
    _character = Character.empty();
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [CharacterSchema],
      directory: dir.path,
    );
    _loadCharacter();
  }

  // 从数据库加载角色
  Future<void> _loadCharacter() async {
    // 获取character 变量
    final character = await isar.characters.get(1);
    // 判断是否存在
    if (character != null) {
      _character = character;
      _saveCharacter();
    } else {
      _character = Character.empty();
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

  Character get character => _character;
}
