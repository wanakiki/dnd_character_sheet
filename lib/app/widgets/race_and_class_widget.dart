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
    // D&D 5E Options
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
      '盗贼',
      '游侠',
      '术士',
      '圣武士',
      '德鲁伊',
      '野蛮人',
      '吟游诗人',
      '武僧',
      '秘术师'
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

    return Row(
      children: [
        _buildAttributeCard(
          context,
          '种族',
          currentRace,
          raceOptions,
          (newValue) => _updateCharacterAttribute(
            context,
            race: newValue,
          ),
        ),
        _buildAttributeCard(
          context,
          '职业',
          currentClass,
          classOptions,
          (newValue) => _updateCharacterAttribute(
            context,
            characterClass: newValue,
          ),
        ),
        _buildAttributeCard(
          context,
          '背景',
          currentBackground,
          backgroundOptions,
          (newValue) => _updateCharacterAttribute(
            context,
            background: newValue,
          ),
        ),
        _buildAttributeCard(
          context,
          '阵营',
          currentAlignment,
          alignmentOptions,
          (newValue) => _updateCharacterAttribute(
            context,
            alignment: newValue,
          ),
        ),
      ],
    );
  }

  Widget _buildAttributeCard(
    BuildContext context,
    String title,
    String currentValue,
    List<String> options,
    ValueChanged<String?> onChanged,
  ) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: InkWell(
        onTap: () => _showOptionsDialog(
          context,
          title,
          currentValue,
          options,
          onChanged,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18.0),
              ),
              Text(
                currentValue,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showOptionsDialog(
    BuildContext context,
    String title,
    String currentValue,
    List<String> options,
    ValueChanged<String?> onChanged,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('选择 $title'),
          content: SingleChildScrollView(
            child: Column(
              children: options.map((String value) {
                return ListTile(
                  title: Text(value),
                  onTap: () {
                    onChanged(value);
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              child: const Text('关闭'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _updateCharacterAttribute(
    BuildContext context, {
    String? race,
    String? characterClass,
    String? background,
    String? alignment,
  }) {
    CharacterManager characterManager =
        Provider.of<CharacterManager>(context, listen: false);

    characterManager.updateCharacter(
      characterManager.character.copyWith(
        race: race ?? characterManager.character.race,
        characterClass:
            characterClass ?? characterManager.character.characterClass,
        background: background ?? characterManager.character.background,
        alignment: alignment ?? characterManager.character.alignment,
      ),
    );
  }
}
