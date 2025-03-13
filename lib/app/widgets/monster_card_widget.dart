import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/gestures.dart';

/*
example data:
[
	{
		"name": "巴布魔",
		"ENG_name": "Babau",
		"size": "M",
		"type": {
			"type": "fiend",
			"tags": [
				"demon"
			]
		},
		"source": "VGM",
		"alignment": [
			"C",
			"E"
		],
		"ac": [
			{
				"ac": 16,
				"from": [
					"天生护甲"
				]
			}
		],
		"hp": {
			"average": 82,
			"formula": "11d8 + 33"
		},
		"speed": {
			"walk": 40
		},
		"str": 19,
		"dex": 16,
		"con": 16,
		"int": 11,
		"wis": 12,
		"cha": 13,
		"skill": {
			"perception": "+5",
			"stealth": "+5"
		},
		"resist": [
			"cold",
			"fire",
			"lightning",
			{
				"resist": [
					"bludgeoning",
					"piercing",
					"slashing"
				],
				"preNote": "非魔法攻击所造成的"
			}
		],
		"immune": [
			"poison"
		],
		"conditionImmune": [
			"poisoned"
		],
		"senses": [
			"黑暗视觉 120 尺"
		],
		"passive": 15,
		"languages": [
			"深渊语"
		],
		"cr": "4",
		"action": [
			{
				"name": "多重攻击",
				"ENG_name": "Multiattack",
				"entries": [
					"巴布魔进行二次近战攻击。它也可以在进行这些攻击之前或之后使用它的弱化凝视。"
				]
			},
			{
				"name": "爪抓",
				"ENG_name": "Claw",
				"entries": [
					"{@atk mw} 命中{@hit 6}，触及5尺，单一目标。{@h}8 ({@damage 1d8 + 4})挥砍伤害。"
				]
			},
			{
				"name": "矛",
				"ENG_name": "Spear",
				"entries": [
					"{@atk mw,rw} 命中{@hit 6}，触及5尺 或 射程20/60尺，单一目标。{@h}7 ({@damage 1d6 + 4})穿刺伤害，或若双手使用以进行一次近战攻击时则造成 8 ({@damage 1d8 + 4})穿刺伤害。"
				]
			},
			{
				"name": "弱化凝视",
				"ENG_name": "Weakening Gaze",
				"entries": [
					"巴布魔选择一个距离它20尺内且它所能看见的生物作为目标。目标必须进行一次DC 13的体质豁免。若豁免失败，则目标在1分钟内使用力量所进行的武器攻击将只造成一半的伤害。目标可以在它的每个回合结束时重复这个豁免检定，豁免成功则结束这个效果对它的影响。"
				]
			}
		],
		"page": 136,
		"spellcasting": [
			{
				"name": "天生施法",
				"ENG_name": "Innate Spellcasting",
				"headerEntries": [
					"巴布魔的天生施法属性为魅力（法术豁免DC 11）。巴布魔天生就可以施展以下法术，且无需任何材料构材："
				],
				"will": [
					"{@spell 黑暗术}",
					"{@spell 解除魔法}",
					"{@spell 恐惧术}",
					"{@spell 灼热金属}",
					"{@spell 浮空术}"
				],
				"ability": "wis",
				"type": "spellcasting"
			}
		],
		"environment": [
			"underdark",
			"urban"
		],
		"soundClip": "https://media-waterdeep.cursecdn.com/file-attachments/0/32/babau.mp3",
		"actionTags": [
			"Multiattack"
		],
		"languageTags": [
			"AB"
		],
		"senseTags": [
			"SD"
		],
		"spellcastingTags": [
			"I"
		],
		"damageTags": [
			"S",
			"P"
		]
	}
]

___
>## 巴布魔
>*中型 邪魔 (恶魔), 混乱 邪恶*
>___
>- **Armor Class** 16（天生护甲）
>- **Hit Points** 82 (11d8 + 33)
>- **Speed** 40 尺
>___
>|STR|DEX|CON|INT|WIS|CHA|
>|:---:|:---:|:---:|:---:|:---:|:---:|
>|19 (+4)|16 (+3)|16 (+3)|11 (+0)|12 (+1)|13 (+1)|
>___
>- **Skills** Perception +5, Stealth +5
>- **Damage Resistances** 冷冻、火焰、闪电、非魔法攻击所造成的 钝击、穿刺和挥砍
>- **Damage Immunities** 毒素
>- **Condition Immunities** poisoned
>- **Senses** 黑暗视觉 120 尺, passive Perception 15
>- **Languages** 深渊语
>- **Challenge** 4 (1,100 XP)
>___
>***天生施法.*** 巴布魔的天生施法属性为魅力（法术豁免DC 11）。巴布魔天生就可以施展以下法术，且无需任何材料构材：  
>
>随意： *黑暗术*、*解除魔法*、*恐惧术*、*灼热金属*、*浮空术*  
>
>### Actions
>***多重攻击.*** 巴布魔进行二次近战攻击。它也可以在进行这些攻击之前或之后使用它的弱化凝视。  
>
>***爪抓.*** *近战 武器攻击：* 命中+6，触及5尺，单一目标。*Hit:* 8 (1d8 + 4)挥砍伤害。  
>
>***矛.*** *近战  或 远程 武器攻击：* 命中+6，触及5尺 或 射程20/60尺，单一目标。*Hit:* 7 (1d6 + 4)穿刺伤害，或若双手使用以进行一次近战攻击时则造成 8 (1d8 + 4)穿刺伤害。  
>
>***弱化凝视.*** 巴布魔选择一个距离它20尺内且它所能看见的生物作为目标。目标必须进行一次DC 13的体质豁免。若豁免失败，则目标在1分钟内使用力量所进行的武器攻击将只造成一半的伤害。目标可以在它的每个回合结束时重复这个豁免检定，豁免成功则结束这个效果对它的影响。

*/

class MonsterPreview extends StatelessWidget {
  final Map<String, dynamic> monster;

  const MonsterPreview({super.key, required this.monster});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 名称和类型
            Text(
              monster['name'] ?? '',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Colors.black),
            ),
            Text(
              '${_getSize(monster['size'])} ${monster['type'] is String ? monster['type'] : monster['type']['type']}',
              style: const TextStyle(
                  fontStyle: FontStyle.italic, color: Colors.black),
            ),
            const Divider(),

            // 基础属性
            _buildPropertyRow('护甲等级', _getAC(monster['ac'])),
            _buildPropertyRow('生命值', _getHP(monster['hp'])),
            _buildPropertyRow('速度', _getSpeed(monster['speed'])),

            // 属性值
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildAbilityScore('力量', monster['str']),
                  _buildAbilityScore('敏捷', monster['dex']),
                  _buildAbilityScore('体质', monster['con']),
                  _buildAbilityScore('智力', monster['int']),
                  _buildAbilityScore('感知', monster['wis']),
                  _buildAbilityScore('魅力', monster['cha']),
                ],
              ),
            ),

            // 技能和特性
            if (monster['skill'] != null)
              _buildPropertyRow('技能', _getSkills(monster['skill'])),
            if (monster['senses'] != null)
              _buildPropertyRow('感官', (monster['senses'] as List).join('，')),
            if (monster['languages'] != null)
              _buildPropertyRow('语言', (monster['languages'] as List).join('，')),
            if (monster['immune'] != null)
              _buildPropertyRow('免疫', (monster['immune'] as List).join('，')),
            if (monster['resist'] != null)
              _buildPropertyRow('抵抗', _getResistances(monster['resist'])),

            // 动作
            if (monster['action'] != null) ...[
              const Divider(),
              const Text('动作',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black)),
              ..._buildActions(context, monster['action']),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label：',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black)),
          Expanded(
              child: Text(value, style: const TextStyle(color: Colors.black))),
        ],
      ),
    );
  }

  Widget _buildAbilityScore(String name, int score) {
    final modifier = (score - 10) ~/ 2;
    final sign = modifier >= 0 ? '+' : '';

    return Column(
      children: [
        Text(name,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black)),
        Text('$score ($sign$modifier)',
            style: const TextStyle(color: Colors.black)),
      ],
    );
  }

  List<Widget> _buildActions(BuildContext context, List<dynamic> actions) {
    return actions.map((action) {
      return Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(action['name'],
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
            ..._parseActionEntries(context, action['entries']),
          ],
        ),
      );
    }).toList();
  }

  List<Widget> _parseActionEntries(BuildContext context, List<String> entries) {
    return entries.map((entry) {
      final regex = RegExp(r'\{@(atk|hit|h|damage) ([^}]+)\}');
      final spans = <TextSpan>[];
      int lastMatchEnd = 0;

      for (final match in regex.allMatches(entry)) {
        if (match.start > lastMatchEnd) {
          spans.add(TextSpan(
              text: entry.substring(lastMatchEnd, match.start),
              style: const TextStyle(color: Colors.black)));
        }

        final type = match.group(1);
        final value = match.group(2);

        spans.add(TextSpan(
          text: _parseActionText(type, value),
          style: TextStyle(
            color:
                type == 'hit' || type == 'damage' ? Colors.blue : Colors.black,
            decoration: type == 'hit' || type == 'damage'
                ? TextDecoration.underline
                : TextDecoration.none,
          ),
          recognizer: (type == 'hit' || type == 'damage')
              ? (TapGestureRecognizer()
                ..onTap = () {
                  if (type == 'hit') {
                    _showAttackRoll(context, '命中', int.parse(value!));
                  } else if (type == 'damage') {
                    _showDamageRoll(context, '伤害', value!, '类型');
                  }
                })
              : null,
        ));

        lastMatchEnd = match.end;
      }

      if (lastMatchEnd < entry.length) {
        spans.add(TextSpan(
            text: entry.substring(lastMatchEnd),
            style: const TextStyle(color: Colors.black)));
      }

      return RichText(text: TextSpan(children: spans));
    }).toList();
  }

  String _parseActionText(String? type, String? value) {
    switch (type) {
      case 'atk':
        if (value == 'mw') {
          return '近战 武器攻击';
        } else if (value == 'mw,rw') {
          return '近战 或 远程 武器攻击';
        }
        return '攻击检定 +$value';
      case 'hit':
        return '命中 +$value';
      case 'h':
        return '伤害 $value';
      case 'damage':
        return '伤害 $value';
      default:
        return '';
    }
  }

  void _showAttackRoll(BuildContext context, String attackName, int toHit) {
    final roll = _rollD20();
    final total = roll + toHit;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$attackName 攻击检定'),
        content: Text('骰点: $roll\n调整值: +$toHit\n总值: $total'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  void _showDamageRoll(BuildContext context, String attackName, String damage,
      String damageType) {
    final result = _calculateDamage(damage);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$attackName 伤害'),
        content: Text('骰点: ${result.rolls.join(', ')}\n'
            '调整值: ${result.modifier}\n'
            '总伤害: ${result.total} $damageType'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  int _rollD20() {
    return Random().nextInt(20) + 1;
  }

  DamageResult _calculateDamage(String damageFormula) {
    final regex = RegExp(r'(\d+)d(\d+)(?:\+(\d+))?');
    final match = regex.firstMatch(damageFormula);

    if (match == null) return DamageResult([], 0, 0);

    final diceCount = int.parse(match.group(1)!);
    final diceType = int.parse(match.group(2)!);
    final modifier = match.group(3) != null ? int.parse(match.group(3)!) : 0;

    final rolls = List.generate(
      diceCount,
      (_) => Random().nextInt(diceType) + 1,
    );

    return DamageResult(
      rolls,
      modifier,
      rolls.reduce((a, b) => a + b) + modifier,
    );
  }

  String _getSize(List<dynamic> size) {
    final sizeMap = {
      'T': '微型',
      'S': '小型',
      'M': '中型',
      'L': '大型',
      'H': '巨型',
      'G': '超巨型'
    };
    return sizeMap[size[0]] ?? size[0];
  }

  String _getAC(List<dynamic> ac) {
    if (ac[0] is int) return ac[0].toString();
    return '${ac[0]['ac']}${ac[0]['from'] != null ? ' (${ac[0]['from'].join(', ')})' : ''}';
  }

  String _getHP(Map<String, dynamic> hp) {
    return '${hp['average']} (${hp['formula']})';
  }

  String _getSpeed(Map<String, dynamic> speed) {
    return speed.entries.map((e) {
      if (e.value is Map) {
        return '${e.key} ${e.value['number']}尺${e.value['condition'] ?? ''}';
      }
      return '${e.key} ${e.value}尺';
    }).join('，');
  }

  String _getSkills(Map<String, dynamic> skills) {
    return skills.entries.map((e) => '${e.key} ${e.value}').join('，');
  }

  String _getResistances(List<dynamic> resistances) {
    return resistances.map((resistance) {
      if (resistance is String) {
        return resistance;
      } else if (resistance is Map) {
        return '${resistance['preNote'] ?? ''}${(resistance['resist'] as List).join('，')}';
      }
      return '';
    }).join('，');
  }
}

class DamageResult {
  final List<int> rolls;
  final int modifier;
  final int total;

  DamageResult(this.rolls, this.modifier, this.total);
}
