// 骰子组模型
// 包含名称、骰子数量、调整值

class DiceSet {
  String name;
  Map<String, int> dices; // 例如：{'D6': 2, 'D20': 1}
  int modifier; // 预设加值

  DiceSet({
    required this.name,
    required this.dices,
    this.modifier = 0,
  });

  factory DiceSet.fromJson(Map<String, dynamic> json) {
    return DiceSet(
      name: json['name'],
      dices: Map<String, int>.from(json['dices'])
          .map((key, value) => MapEntry(key.toUpperCase(), value)),
      modifier: json['modifier'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'dices': dices,
      'modifier': modifier,
    };
  }

  @override
  String toString() {
    String diceString =
        dices.entries.map((e) => '${e.value}${e.key}').join(' + ');
    String modifierString = modifier != 0 ? ' + $modifier' : '';
    return '$name: $diceString$modifierString';
  }

  factory DiceSet.standard() {
    return DiceSet(
      name: 'D20',
      dices: {'D20': 1},
      modifier: 0,
    );
  }
}
