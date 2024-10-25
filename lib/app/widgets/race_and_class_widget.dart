import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dnd_character/app/data/character_manager.dart';

class CharacterDetailsWidget extends StatelessWidget {
  final String currentRace;
  final String currentClass;
  final String currentBackground;
  final String currentAlignment;

  const CharacterDetailsWidget({
    Key? key,
    required this.currentRace,
    required this.currentClass,
    required this.currentBackground,
    required this.currentAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> raceOptions = [
      '人类',
      '精灵',
      '矮人',
      '半身人',
      '龙裔',
      '侏儒',
      '半兽人',
      '提夫林'
    ];
    final List<String> classOptions = [
      '战士',
      '法师',
      '牧师',
      '游荡者',
      '游侠',
      '术士',
      '圣武士',
      '德鲁伊',
      '野蛮人',
      '吟游诗人',
      '武僧',
      '邪术师',
      '奇械师'
    ];
    final List<String> backgroundOptions = [
      '平民英雄',
      '贵族',
      '士兵',
      '流浪者',
      '学者',
      '工匠',
      '罪犯',
      '牧民'
    ];
    final List<String> alignmentOptions = [
      '守序善良',
      '中立善良',
      '混乱善良',
      '守序中立',
      '绝对中立',
      '混乱中立',
      '守序邪恶',
      '中立邪恶',
      '混乱邪恶'
    ];

    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: [
        _buildAttributeChip(context, '种族', currentRace, raceOptions),
        _buildAttributeChip(context, '职业', currentClass, classOptions),
        _buildAttributeChip(
            context, '背景', currentBackground, backgroundOptions),
        _buildAttributeChip(context, '阵营', currentAlignment, alignmentOptions),
      ],
    );
  }

  Widget _buildAttributeChip(BuildContext context, String title,
      String currentValue, List<String> options) {
    return ActionChip(
      label: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Text(title, style: Theme.of(context).textTheme.titleSmall),
          Text(currentValue, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
      onPressed: () =>
          _showOptionsDialog(context, title, currentValue, options),
    );
  }

  void _showOptionsDialog(BuildContext context, String title,
      String currentValue, List<String> options) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title:
              Text('选择$title', style: Theme.of(context).textTheme.titleLarge),
          children: [
            ...options.map((String value) => SimpleDialogOption(
                  onPressed: () {
                    _updateCharacterAttribute(context, title, value);
                    Navigator.pop(context);
                  },
                  child: Text(value,
                      style: Theme.of(context).textTheme.bodyMedium),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: '手动输入$title',
                ),
                onSubmitted: (String value) {
                  _updateCharacterAttribute(context, title, value);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void _updateCharacterAttribute(
      BuildContext context, String attribute, String value) {
    final characterManager =
        Provider.of<CharacterManager>(context, listen: false);
    final updatedAttributes = {
      if (attribute == '种族') 'race': value,
      if (attribute == '职业') 'characterClass': value,
      if (attribute == '背景') 'background': value,
      if (attribute == '阵营') 'alignment': value,
    };
    characterManager.updateCharacter(updatedAttributes);
  }
}
