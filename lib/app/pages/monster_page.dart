import 'package:flutter/material.dart';
import 'dart:math';

String data = """[
	{
		"name": "猬魔",
		"ENG_name": "Barbed Devil",
		"source": "MM",
		"page": 70,
		"srd": true,
		"otherSources": [
			{
				"source": "RoT"
			},
			{
				"source": "ToA"
			},
			{
				"source": "WDH"
			},
			{
				"source": "WDMM"
			},
			{
				"source": "BGDIA"
			},
			{
				"source": "EGW"
			},
			{
				"source": "IDRotF"
			},
			{
				"source": "TCE"
			},
			{
				"source": "GHLoE"
			},
			{
				"source": "VEoR"
			},
			{
				"source": "CoA"
			}
		],
		"size": [
			"M"
		],
		"type": {
			"type": "fiend",
			"tags": [
				"devil"
			]
		},
		"alignment": [
			"L",
			"E"
		],
		"ac": [
			{
				"ac": 15,
				"from": [
					"天生护甲"
				]
			}
		],
		"hp": {
			"average": 110,
			"formula": "13d8 + 52"
		},
		"speed": {
			"walk": 30
		},
		"str": 16,
		"dex": 17,
		"con": 18,
		"int": 12,
		"wis": 14,
		"cha": 14,
		"save": {
			"str": "+6",
			"con": "+7",
			"wis": "+5",
			"cha": "+5"
		},
		"skill": {
			"deception": "+5",
			"insight": "+5",
			"perception": "+8"
		},
		"senses": [
			"黑暗视觉 120 尺"
		],
		"passive": 18,
		"resist": [
			"冷冻",
			{
				"resist": [
					"钝击",
					"穿刺",
					"斩击"
				],
				"note": "非银质武器且非魔法攻击的",
				"cond": true
			}
		],
		"immune": [
			"火焰",
			"毒素"
		],
		"conditionImmune": [
			"中毒"
		],
		"languages": [
			"炼狱语",
			"心灵感应 120 尺"
		],
		"cr": "5",
		"trait": [
			{
				"name": "猬皮",
				"ENG_name": "Barbed Hide",
				"entries": [
					"猬魔在其每个自己回合开始时对所有受其擒抱的生物造成5（{@damage 1d10}）点穿刺伤害。"
				]
			},
			{
				"name": "魔鬼视界",
				"ENG_name": "Devil's Sight",
				"entries": [
					"魔法黑暗不会阻碍魔鬼的黑暗视觉。"
				]
			},
			{
				"name": "魔法抗性",
				"ENG_name": "Magic Resistance",
				"entries": [
					"该魔鬼为抵抗法术和其它魔法效应而作的豁免检定具有优势。"
				]
			}
		],
		"action": [
			{
				"name": "多重攻击",
				"ENG_name": "Multiattack",
				"entries": [
					"恶魔发动三次武器攻击：一次尾击，两次爪击。或者它也可以使用两次投掷烈焰。"
				]
			},
			{
				"name": "爪击",
				"ENG_name": "Claw",
				"entries": [
					"{@atk mw} 命中{@hit 6}，触及 5 尺，单一目标。{@h}6 ({@damage 1d6 + 3}) 点穿刺伤害。"
				]
			},
			{
				"name": "尾击",
				"ENG_name": "Tail",
				"entries": [
					"{@atk mw} 命中{@hit 6}，触及5尺，单一目标。{@h}10（{@damage 2d6 + 3}）点穿刺伤害。"
				]
			},
			{
				"name": "投掷烈焰",
				"ENG_name": "Hurl Flame",
				"entries": [
					"{@atk rs} 命中{@hit 5}，射程 150 尺，单一目标。{@h}10 ({@damage 3d6}) 点火焰伤害。火焰将点燃所有未被着装或携带的可燃物件。"
				]
			}
		],
		"variant": [
			{
				"type": "variant",
				"name": "召唤恶魔（1/日）",
				"ENG_name": "Summon Devil (1/Day)",
				"entries": [
					"恶魔选择要召唤的对象，并尝试进行魔法召唤。",
					"一个猬魔有{@chance 30}%的几率召唤一个猬魔。",
					"一个被召唤的恶魔出现在其召唤者60尺范围内的未被占据的空间内，作为其召唤者的盟友行动，并且不能召唤其他恶魔。它将持续存在1分钟，直到它或其召唤者死亡，或者直到其召唤者以一个动作将其解散。"
				],
				"_version": {
					"name": "猬魔（召唤师）",
					"ENG_name": "Barbed Devil (Summoner)",
					"addAs": "动作"
				}
			}
		],
		"soundClip": {
			"type": "internal",
			"path": "bestiary/barbed-devil.mp3"
		},
		"traitTags": [
			"魔鬼视界",
			"魔法抗性"
		],
		"senseTags": [
			"SD"
		],
		"actionTags": [
			"多重攻击"
		],
		"languageTags": [
			"I",
			"TP"
		],
		"damageTags": [
			"F",
			"P"
		],
		"miscTags": [
			"MW"
		],
		"hasToken": true,
		"hasFluff": true,
		"hasFluffImages": true,
		"__prop": "monster",
		"_pTypes": {
			"types": [
				"fiend"
			],
			"tags": [
				"devil"
			],
			"asText": "邪魔 (魔鬼)",
			"asTextShort": "邪魔 (魔鬼)",
			"typeSidekick": null,
			"tagsSidekick": [],
			"asTextSidekick": null
		},
		"_pCr": "5",
		"_fCr": [
			"5"
		],
		"_fSources": [
			"MM",
			{
				"item": "RoT",
				"isIgnoreRed": true,
				"rendered": null,
				"searchText": null,
				"isOtherSource": true,
				"_sortName": null,
				"itemFull": "提亚马特的崛起"
			},
			{
				"item": "ToA",
				"isIgnoreRed": true,
				"rendered": null,
				"searchText": null,
				"isOtherSource": true,
				"_sortName": null,
				"itemFull": "湮灭之墓"
			},
			{
				"item": "WDH",
				"isIgnoreRed": true,
				"rendered": null,
				"searchText": null,
				"isOtherSource": true,
				"_sortName": null,
				"itemFull": "深水城：龙金飞劫"
			},
			{
				"item": "WDMM",
				"isIgnoreRed": true,
				"rendered": null,
				"searchText": null,
				"isOtherSource": true,
				"_sortName": null,
				"itemFull": "深水城：疯法师的地下城"
			},
			{
				"item": "BGDIA",
				"isIgnoreRed": true,
				"rendered": null,
				"searchText": null,
				"isOtherSource": true,
				"_sortName": null,
				"itemFull": "博德之门：坠入阿弗纳斯"
			},
			{
				"item": "EGW",
				"isIgnoreRed": true,
				"rendered": null,
				"searchText": null,
				"isOtherSource": true,
				"_sortName": null,
				"itemFull": "荒洲探险家指南"
			},
			{
				"item": "IDRotF",
				"isIgnoreRed": true,
				"rendered": null,
				"searchText": null,
				"isOtherSource": true,
				"_sortName": null,
				"itemFull": "冰风谷：冰霜少女的雾凇"
			},
			{
				"item": "TCE",
				"isIgnoreRed": true,
				"rendered": null,
				"searchText": null,
				"isOtherSource": true,
				"_sortName": null,
				"itemFull": "塔莎的万事坩埚"
			},
			{
				"item": "GHLoE",
				"isIgnoreRed": true,
				"rendered": null,
				"searchText": null,
				"isOtherSource": true,
				"_sortName": null,
				"itemFull": "Grim Hollow: Lairs of Etharis"
			},
			{
				"item": "VEoR",
				"isIgnoreRed": true,
				"rendered": null,
				"searchText": null,
				"isOtherSource": true,
				"_sortName": null,
				"itemFull": "维克那：毁灭前夜"
			},
			{
				"item": "CoA",
				"isIgnoreRed": true,
				"rendered": null,
				"searchText": null,
				"isOtherSource": true,
				"_sortName": null,
				"itemFull": "Chains of Asmodeus"
			}
		],
		"_fSpeedType": [
			"walk"
		],
		"_fSpeed": 30,
		"_fAc": [
			15
		],
		"_fHp": 110,
		"_fAlign": [
			"L",
			"E"
		],
		"_fEnvironment": [
			"none"
		],
		"_fVuln": [],
		"_fRes": [
			"冷冻",
			"钝击 (条件)",
			"穿刺 (条件)",
			"斩击 (条件)"
		],
		"_fImm": [
			"火焰",
			"毒素"
		],
		"_fCondImm": [
			"中毒"
		],
		"_fSave": [
			"str",
			"con",
			"wis",
			"cha"
		],
		"_fSkill": [
			"deception",
			"insight",
			"perception"
		],
		"_fPassive": 18,
		"_fStr": 16,
		"_fDex": 17,
		"_fCon": 18,
		"_fInt": 12,
		"_fWis": 14,
		"_fCha": 14,
		"_fMisc": [
			"SRD 5.1",
			"有简介",
			"有图片",
			"MW",
			"Has Variants",
			"有Token",
			"有简介",
			"有图片"
		],
		"_fLanguageTags": [
			"I",
			"TP"
		],
		"_fEquipment": []
	}
]""";

class MonsterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('怪物图鉴'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '猬魔 (Barbed Devil)',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Divider(),

                  // 基础属性
                  _buildStatBlock('护甲等级', '15 (天生护甲)'),
                  _buildStatBlock('生命值', '110 (13d8 + 52)'),
                  _buildStatBlock('速度', '30尺'),

                  // 攻击部分
                  const SizedBox(height: 16),
                  Text('攻击', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),

                  // 多重攻击
                  Text('多重攻击：恶魔发动三次武器攻击：一次尾击，两次爪击。或者它也可以使用两次投掷烈焰。'),
                  const SizedBox(height: 8),

                  // 爪击
                  _buildAttackBlock(
                    context,
                    name: '爪击',
                    toHit: 6,
                    damage: '1d6+3',
                    damageType: '穿刺',
                    range: '触及5尺',
                  ),

                  // 尾击
                  _buildAttackBlock(
                    context,
                    name: '尾击',
                    toHit: 6,
                    damage: '2d6+3',
                    damageType: '穿刺',
                    range: '触及5尺',
                  ),

                  // 投掷烈焰
                  _buildAttackBlock(
                    context,
                    name: '投掷烈焰',
                    toHit: 5,
                    damage: '3d6',
                    damageType: '火焰',
                    range: '射程150尺',
                  ),

                  // 其他属性部分...
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatBlock(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildAttackBlock(
    BuildContext context, {
    required String name,
    required int toHit,
    required String damage,
    required String damageType,
    required String range,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Row(
            children: [
              InkWell(
                onTap: () => _showAttackRoll(context, name, toHit),
                child: Text(
                  '命中 +$toHit',
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const Text(', '),
              Text(range),
              const Text(', '),
              InkWell(
                onTap: () => _showDamageRoll(context, name, damage, damageType),
                child: Text(
                  '伤害: $damage',
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Text(' $damageType'),
            ],
          ),
        ],
      ),
    );
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
    // 解析伤害公式，如 "2d6+3"
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
}

class DamageResult {
  final List<int> rolls;
  final int modifier;
  final int total;

  DamageResult(this.rolls, this.modifier, this.total);
}
