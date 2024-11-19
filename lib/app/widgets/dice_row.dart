import 'package:flutter/material.dart';
import 'package:dnd_character/app/data/diceset.dart';
import 'package:provider/provider.dart';
import 'package:dnd_character/app/data/character_manager.dart';
import 'dice_roll.dart';

class DiceRow extends StatefulWidget {
  @override
  _DiceRowState createState() => _DiceRowState();
}

class _DiceRowState extends State<DiceRow> {
  Map<String, int> diceCount = {
    'D4': 0,
    'D6': 0,
    'D8': 0,
    'D10': 0,
    'D12': 0,
    'D20': 0,
  };

  void _incrementDice(String diceType) {
    setState(() {
      diceCount[diceType] = (diceCount[diceType] ?? 0) + 1;
    });
  }

  void _resetDice() {
    setState(() {
      diceCount.updateAll((key, value) => 0);
    });
  }

  void _rollDice(BuildContext context) {
    List<int> dices = [
      diceCount['D4']!,
      diceCount['D6']!,
      diceCount['D8']!,
      diceCount['D10']!,
      diceCount['D12']!,
      diceCount['D20']!,
    ];

    if (dices.any((count) => count > 0)) {
      DiceSet tempDiceSet = DiceSet(
        name: '快速投掷',
        dices: dices,
        modifier: 0,
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return DiceRollPopup(diceSet: tempDiceSet);
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('请至少选择一个骰子进行投掷')),
      );
    }
  }

  void _saveDiceSet(BuildContext context) {
    List<int> dices = [
      diceCount['D4']!,
      diceCount['D6']!,
      diceCount['D8']!,
      diceCount['D10']!,
      diceCount['D12']!,
      diceCount['D20']!,
    ];

    if (dices.every((count) => count == 0)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('请至少选择一个骰子')),
      );
      return;
    }

    String diceSetName = '';
    int modifier = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('保存骰子组'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: '骰子组名称'),
                onChanged: (value) {
                  diceSetName = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: '调整值'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  modifier = int.tryParse(value) ?? 0;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('保存'),
              onPressed: () {
                if (diceSetName.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('请输入骰子组名称')),
                  );
                  return;
                }

                DiceSet newDiceSet = DiceSet(
                  name: diceSetName,
                  dices: dices,
                  modifier: modifier,
                );

                Provider.of<CharacterManager>(context, listen: false)
                    .addDiceSet(newDiceSet);

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDiceButton('D4'),
            _buildDiceButton('D6'),
            _buildDiceButton('D8'),
            _buildDiceButton('D10'),
            _buildDiceButton('D12'),
            _buildDiceButton('D20'),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.refresh),
              label: Text('重置'),
              onPressed: _resetDice,
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.casino),
              label: Text('投掷'),
              onPressed: () => _rollDice(context),
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.save),
              label: Text('保存'),
              onPressed: () => _saveDiceSet(context),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDiceButton(String diceType) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => _incrementDice(diceType),
          child: Card(
            color: diceCount[diceType]! > 0
                ? Theme.of(context).colorScheme.primaryContainer
                : null,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                diceType,
                style: TextStyle(
                  color: diceCount[diceType]! > 0
                      ? Theme.of(context).colorScheme.onPrimaryContainer
                      : null,
                ),
              ),
            ),
          ),
        ),
        if (diceCount[diceType]! > 0) // 仅在计数大于0时显示
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: Text(
                '${diceCount[diceType]}', // 显示当前计数
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
