// 龙与地下城角色数据模型
// 包含血量、生命值、种族、职业、骰子袋

import 'package:dnd_character/app/data/diceset.dart';

class Character {
  String name;
  String race;
  String characterClass;
  String background;
  String alignment;
  int level;
  int experiencePoints;
  Map<String, int> attributes; // 六维属性字典
  int currentHitPoints;
  int maxHitPoints;
  int armorClass;
  int initiative;
  int speed;
  List<int> coin; // [gold, silver, copper]
  String avatarUrl;
  List<DiceSet> diceBag; // 新增骰子袋属性

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
      attributes: Map<String, int>.from(json['attributes']),
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
        'Dice Bag: ${diceBag.map((diceSet) => diceSet.toString()).join(', ')}';
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
      attributes: {
        '力量': 10,
        '敏捷': 10,
        '体质': 10,
        '智力': 10,
        '感知': 10,
        '魅力': 10,
      },
      currentHitPoints: 8,
      maxHitPoints: 10,
      armorClass: 10,
      initiative: 10,
      speed: 30,
      coin: [20, 15, 10],
      avatarUrl: '',
      diceBag: [
        DiceSet.standard(),
        DiceSet(name: "武器命中", dices: {'D20': 1}, modifier: 4),
        DiceSet(name: "伤害骰", dices: {'D8': 1}, modifier: 10),
        DiceSet(name: "伤害骰", dices: {'D6': 8}),
        DiceSet(name: "伤害骰", dices: {'D8': 1})
      ], // 添加标准骰子组
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
    Map<String, int>? attributes,
    int? currentHitPoints,
    int? maxHitPoints,
    int? armorClass,
    int? initiative,
    int? speed,
    List<int>? coin,
    String? avatarUrl,
    List<DiceSet>? diceBag,
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
    );
  }
}
