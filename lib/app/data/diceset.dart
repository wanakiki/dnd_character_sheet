// 骰子组模型
// 包含名称、骰子数量、调整值

import 'package:isar/isar.dart';
part 'diceset.g.dart';

@embedded
class DiceSet {
  String name;
  List<int> dices =
      []; // D4 6 8 10 12 20 例如：[0, 2, 0, 0, 0, 1] 表示 2 个 D6 和 1 个 D20
  int modifier; // 预设加值

  DiceSet({
    this.name = 'D20',
    this.dices = const [0, 0, 0, 0, 0, 1],
    this.modifier = 0,
  });

  factory DiceSet.fromJson(Map<String, dynamic> json) {
    return DiceSet(
      name: json['name'],
      dices: List<int>.from(json['dices']),
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
    List<String> diceTypes = ['D4', 'D6', 'D8', 'D10', 'D12', 'D20'];
    String diceString = dices
        .asMap()
        .entries
        .where((entry) => entry.value > 0)
        .map((entry) => '${entry.value}${diceTypes[entry.key]}')
        .join(' + ');
    String modifierString = modifier != 0 ? ' + $modifier' : '';
    return '$name: $diceString$modifierString';
  }

  factory DiceSet.standard() {
    return DiceSet(
      name: 'D20',
      dices: [0, 0, 0, 0, 0, 1], // 1 个 D20
      modifier: 0,
    );
  }
}
