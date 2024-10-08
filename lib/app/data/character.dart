// 龙与地下城角色数据模型
// 包含血量、生命值、种族、职业、骰子袋、背包

import 'package:dnd_character/app/data/diceset.dart';
import 'package:isar/isar.dart';
import 'items.dart';

part 'character.g.dart';

@collection
class Character {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String name;
  String race;
  String characterClass;
  String background;
  String alignment;
  int level;
  int experiencePoints;
  List<int> attributes; // 六维属性列表，顺序为：力量、敏捷、体质、智力、感知、魅力
  int currentHitPoints;
  int maxHitPoints;
  int armorClass;
  int initiative;
  int speed;
  List<int> coin; // [gold, silver, copper]
  String avatarUrl;
  List<DiceSet> diceBag; // 新增骰子袋属性
  List<Item> backpack; // 新增背包属性

  Character({
    required this.name,
    required this.race,
    required this.characterClass,
    required this.background,
    required this.alignment,
    this.level = 1,
    this.experiencePoints = 0,
    required this.attributes,
    required this.currentHitPoints,
    required this.maxHitPoints,
    required this.armorClass,
    required this.initiative,
    required this.speed,
    this.coin = const [0, 0, 0],
    this.avatarUrl = '',
    this.diceBag = const [], // 初始化骰子袋
    this.backpack = const [], // 初始化背包
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      race: json['race'],
      characterClass: json['characterClass'],
      background: json['background'],
      alignment: json['alignment'],
      level: json['level'],
      experiencePoints: json['experiencePoints'],
      attributes: List<int>.from(json['attributes']),
      currentHitPoints: json['currentHitPoints'],
      maxHitPoints: json['maxHitPoints'],
      armorClass: json['armorClass'],
      initiative: json['initiative'],
      speed: json['speed'],
      coin: List<int>.from(json['coin']),
      avatarUrl: json['avatarUrl'],
      diceBag: (json['diceBag'] as List<dynamic>?)
              ?.map((e) => DiceSet.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      backpack: (json['backpack'] as List<dynamic>?)
              ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'race': race,
      'characterClass': characterClass,
      'background': background,
      'alignment': alignment,
      'level': level,
      'experiencePoints': experiencePoints,
      'attributes': attributes,
      'currentHitPoints': currentHitPoints,
      'maxHitPoints': maxHitPoints,
      'armorClass': armorClass,
      'initiative': initiative,
      'speed': speed,
      'coin': coin,
      'avatarUrl': avatarUrl,
      'diceBag': diceBag.map((diceSet) => diceSet.toJson()).toList(),
      'backpack': backpack.map((item) => item.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'Name: $name\n'
        'Race: $race\n'
        'Class: $characterClass\n'
        'Background: $background\n'
        'Alignment: $alignment\n'
        'Level: $level\n'
        'Experience Points: $experiencePoints\n'
        'Attributes: $attributes\n'
        'HP: $currentHitPoints/$maxHitPoints, AC: $armorClass, Initiative: $initiative, Speed: $speed\n'
        'Coin (Gold, Silver, Copper): ${coin[0]}, ${coin[1]}, ${coin[2]}\n'
        'Avatar: $avatarUrl\n'
        'Dice Bag: ${diceBag.map((diceSet) => diceSet.toString()).join(', ')}\n'
        'Backpack: ${backpack.map((item) => item.toString()).join(', ')}';
  }

  // Factory constructor to create a default empty character
  factory Character.empty() {
    return Character(
      name: 'Unnamed Hero',
      race: '人类',
      characterClass: '战士',
      background: '士兵',
      alignment: '守序善良',
      level: 1,
      experiencePoints: 25,
      attributes: [10, 10, 10, 10, 10, 10], // 初始化六维属性
      currentHitPoints: 8,
      maxHitPoints: 10,
      armorClass: 10,
      initiative: 10,
      speed: 30,
      coin: [20, 15, 10],
      avatarUrl: '',
      diceBag: [
        DiceSet.standard(),
      ], // 添加标准骰子组
      backpack: [
        Item(name: 'Sword', quantity: 1, description: 'A sharp blade')
      ], // 初始化空背包
    );
  }

  // CopyWith method to create a new character with updated values
  Character copyWith({
    String? name,
    String? race,
    String? characterClass,
    String? background,
    String? alignment,
    int? level,
    int? experiencePoints,
    List<int>? attributes,
    int? currentHitPoints,
    int? maxHitPoints,
    int? armorClass,
    int? initiative,
    int? speed,
    List<int>? coin,
    String? avatarUrl,
    List<DiceSet>? diceBag,
    List<Item>? backpack,
  }) {
    return Character(
      name: name ?? this.name,
      race: race ?? this.race,
      characterClass: characterClass ?? this.characterClass,
      background: background ?? this.background,
      alignment: alignment ?? this.alignment,
      level: level ?? this.level,
      experiencePoints: experiencePoints ?? this.experiencePoints,
      attributes: attributes ?? this.attributes,
      currentHitPoints: currentHitPoints ?? this.currentHitPoints,
      maxHitPoints: maxHitPoints ?? this.maxHitPoints,
      armorClass: armorClass ?? this.armorClass,
      initiative: initiative ?? this.initiative,
      speed: speed ?? this.speed,
      coin: coin ?? this.coin,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      diceBag: diceBag ?? this.diceBag,
      backpack: backpack ?? this.backpack,
    );
  }
}
