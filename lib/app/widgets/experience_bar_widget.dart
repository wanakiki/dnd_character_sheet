import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dnd_character/app/data/character_manager.dart';

class ExperienceBar extends StatelessWidget {
  final int currentExperience;
  final int currentLevel;

  ExperienceBar({required this.currentExperience, required this.currentLevel});

  @override
  Widget build(BuildContext context) {
    final int nextLevelXP = _experienceForNextLevel(currentLevel);
    final double progress = currentExperience / nextLevelXP;
    final int proficiencyBonus = _proficiencyBonusForLevel(currentLevel);

    return InkWell(
      onTap: () => _showExperienceInputDialog(context),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 20.0,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          SizedBox(height: 8),
          Text(
              'XP: $currentExperience / $nextLevelXP | LV: $currentLevel | +$proficiencyBonus'),
        ],
      ),
    );
  }

  int _experienceForNextLevel(int level) {
    const List<int> xpThresholds = [
      300,
      900,
      2700,
      6500,
      14000,
      23000,
      34000,
      48000,
      64000,
      85000,
      100000,
      120000,
      140000,
      165000,
      195000,
      225000,
      265000,
      305000,
      355000
    ];

    return (level > 0 && level < 20)
        ? xpThresholds[level - 1]
        : xpThresholds.last;
  }

  int _proficiencyBonusForLevel(int level) {
    if (level >= 1 && level <= 4) return 2;
    if (level >= 5 && level <= 8) return 3;
    if (level >= 9 && level <= 12) return 4;
    if (level >= 13 && level <= 16) return 5;
    if (level >= 17 && level <= 20) return 6;
    return 2; // Default value for level 1
  }

  void _showExperienceInputDialog(BuildContext context) {
    TextEditingController xpController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('调整经验值'),
          content: TextField(
            controller: xpController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "输入获得或失去的经验值"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('取消'),
            ),
            TextButton(
              onPressed: () {
                int deltaXP = int.tryParse(xpController.text) ?? 0;
                _updateExperience(context, deltaXP);
                Navigator.of(context).pop();
              },
              child: Text('确认'),
            ),
          ],
        );
      },
    );
  }

  void _updateExperience(BuildContext context, int deltaXP) {
    CharacterManager characterManager =
        Provider.of<CharacterManager>(context, listen: false);
    int newExperience = currentExperience + deltaXP;
    int newLevel = currentLevel;

    // 检查经验值是否低于0
    if (newExperience < 0) {
      newExperience = 0;
    }

    // 检查经验值是否超过最大值
    int maxExperience = _experienceForNextLevel(20);
    if (newExperience > maxExperience) {
      newExperience = maxExperience;
    }

    while (
        newExperience >= _experienceForNextLevel(newLevel) && newLevel < 20) {
      newLevel++;
    }

    while (
        newExperience < _experienceForNextLevel(newLevel - 1) && newLevel > 1) {
      newLevel--;
    }

    characterManager.updateCharacter({
      'experiencePoints': newExperience,
      'level': newLevel,
    });
  }
}
