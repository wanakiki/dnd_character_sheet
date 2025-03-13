import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/consumable_widget.dart';

import '../widgets/monster_card_widget.dart';

class MonsterPreviewScreen extends StatelessWidget {
  final Map<String, dynamic> monsterData = {
    "name": "活化棺材",
    "ENG_name": "Animated Coffin",
    "source": "AATM",
    "size": ["L"],
    "type": "construct",
    "alignment": ["U"],
    "ac": [
      {
        "ac": 16,
        "from": ["天生护甲"]
      }
    ],
    "hp": {"average": 60, "formula": "8d10 + 16"},
    "speed": {"walk": 30, "climb": 30},
    "str": 16,
    "dex": 12,
    "con": 15,
    "int": 3,
    "wis": 11,
    "cha": 3,
    "senses": ["盲视 60 尺（不能看到这个半径之外）"],
    "passive": 10,
    "immune": ["毒素", "心灵"],
    "conditionImmune": ["目盲", "魅惑", "耳聋", "力竭", "恐慌", "麻痹", "石化", "中毒"],
    "languages": ["能理解其创造者的语言但无法说话"],
    "cr": "3",
    "trait": [
      {
        "name": "拟形",
        "ENG_name": "False Appearance",
        "entries": [
          "如果动画棺材在战斗开始时静止不动，它在其主动权骰上有优势。此外，如果一个生物没有观察到棺材移动或行动，该生物必须在智力（{@skill 调查}）检定上成功通过一个{@skill 调查}的骰子，才能辨别出棺材是活动的。"
        ]
      },
      {
        "name": "蛛行术",
        "ENG_name": "Spider Climb",
        "entries": ["活化棺材能够攀爬困难的表面，包括在天花板上倒挂，无需进行属性检定。"]
      }
    ],
    "action": [
      {
        "name": "多重攻击",
        "ENG_name": "Multiattack",
        "entries": ["活化棺材进行两次猛击攻击。"]
      },
      {
        "name": "猛击",
        "ENG_name": "Slam",
        "entries": [
          "{@atk mw} 命中{@hit 5}，触及5尺，单一目标。{@h}12 ({@damage 2d8 + 3}) 钝击伤害。"
        ]
      },
      {
        "name": "陷阱",
        "ENG_name": "Entrap",
        "entries": [
          "{@atk mw} 命中{@hit 5}，触及5尺，一个大型或更小的生物。{@h}目标获得{@condition 擒抱}状态（逃脱{@dc 13}）。直到这个擒抱结束，如果目标不是不死生物，目标获得{@condition 束缚}状态，并在其每个回合开始时受到14点（{@damage 4d6}）点穿刺伤害。这个活化棺材一次只能擒抱一个生物。"
        ]
      }
    ],
    "traitTags": ["拟形", "蛛行术"],
    "senseTags": ["B"],
    "actionTags": ["多重攻击"],
    "languageTags": ["CS"],
    "damageTags": ["B", "P"],
    "miscTags": ["MW"],
    "hasToken": true,
    "hasFluff": true,
    "hasFluffImages": true
  };

  MonsterPreviewScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('怪物预览'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: MonsterPreview(monster: monsterData),
      ),
    );
  }
}

class WidgetTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MonsterPreviewScreen();
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Widget测试'),
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         MonsterPreviewScreen(),
    //       ],
    //     ),
    //   ),
    // );
  }
}
