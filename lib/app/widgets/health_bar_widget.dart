import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dnd_character/app/data/character_manager.dart';

class HealthBar extends StatelessWidget {
  final int currentHitPoints;
  final int maxHitPoints;
  final int temporaryHitPoints; // New field for temporary hit points

  HealthBar({
    required this.currentHitPoints,
    required this.maxHitPoints,
    required this.temporaryHitPoints,
  });

  @override
  Widget build(BuildContext context) {
    double totalHitPoints = currentHitPoints + temporaryHitPoints.toDouble();
    double healthPercentage = totalHitPoints / maxHitPoints;

    return GestureDetector(
      onTap: () => _showHealthDialog(context),
      child: Column(
        children: [
          Text(
            'HP: $currentHitPoints / $maxHitPoints' +
                (temporaryHitPoints > 0
                    ? ' (Temporary: $temporaryHitPoints)'
                    : ''),
            style: TextStyle(fontSize: 14.0),
          ),
          SizedBox(height: 4.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: LinearProgressIndicator(
              value: healthPercentage,
              backgroundColor: Colors.red.withOpacity(0.5),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              minHeight: 20.0,
            ),
          ),
        ],
      ),
    );
  }

  void _showHealthDialog(BuildContext context) {
    int newHitPoints = currentHitPoints;
    int newMaxHitPoints = maxHitPoints;
    int newTemporaryHitPoints =
        temporaryHitPoints; // Track changes to temporary hit points
    TextEditingController maxHpController =
        TextEditingController(text: maxHitPoints.toString());
    TextEditingController tempHpController =
        TextEditingController(text: temporaryHitPoints.toString());

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('调整生命值'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('当前: $currentHitPoints / $maxHitPoints'),
                  TextField(
                    controller: maxHpController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: '新的最大生命值'),
                    onChanged: (value) {
                      setState(() {
                        newMaxHitPoints =
                            int.tryParse(value) ?? newMaxHitPoints;
                        newHitPoints = newMaxHitPoints;
                      });
                    },
                  ),
                  TextField(
                    controller: tempHpController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: '临时生命值'),
                    onChanged: (value) {
                      setState(() {
                        newTemporaryHitPoints =
                            int.tryParse(value) ?? newTemporaryHitPoints;
                      });
                    },
                  ),
                  Row(
                    children: [
                      Text(
                        '调整: ${newHitPoints - currentHitPoints}',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: newHitPoints > currentHitPoints
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                      Slider(
                        value: newHitPoints.toDouble(),
                        min: 0,
                        max: newMaxHitPoints.toDouble(),
                        divisions: newMaxHitPoints,
                        label: newHitPoints.toString(),
                        onChanged: (value) {
                          setState(() {
                            newHitPoints = value.toInt();
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('取消'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(newHitPoints);
                    // 更新角色生命值和最大生命值
                    CharacterManager characterManager =
                        Provider.of<CharacterManager>(context, listen: false);
                    characterManager.updateCharacter({
                      'currentHitPoints': newHitPoints,
                      'maxHitPoints': newMaxHitPoints,
                      'temporaryHitPoints': newTemporaryHitPoints,
                    });
                  },
                  child: Text('确认'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
