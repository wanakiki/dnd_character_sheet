import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dnd_character/app/data/diceset.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 用于展示骰子结果的弹出界面
class DiceRollPopup extends StatefulWidget {
  final DiceSet diceSet;
  final bool advantageDisadvantage;

  const DiceRollPopup(
      {Key? key, required this.diceSet, this.advantageDisadvantage = false})
      : super(key: key);

  @override
  _DiceRollPopupState createState() => _DiceRollPopupState();
}

class _DiceRollPopupState extends State<DiceRollPopup>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _result = 0;
  int _secondResult = 0;
  Map<String, List<int>> _diceResults = {};
  Map<String, List<int>> _secondDiceResults = {};

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _rollDice();
  }

  void _rollDice() {
    setState(() {
      _result = 0;
      _secondResult = 0;
      _diceResults.clear();
      _secondDiceResults.clear();

      // TODO check the calculation logic
      const sidesList = [4, 6, 8, 10, 12, 20]; // 定义面数列表
      for (int i = 0; i < widget.diceSet.dices.length; i++) {
        int count = widget.diceSet.dices[i];
        if (count == 0) continue;
        String diceType = 'D${sidesList[i]}'; // 根据索引和面数列表推断骰子类型
        _diceResults[diceType] = [];
        _secondDiceResults[diceType] = [];
        for (int j = 0; j < count; j++) {
          int sides = sidesList[i]; // 根据索引和面数列表推断骰子的面数
          int roll = Random().nextInt(sides) + 1;
          _diceResults[diceType]!.add(roll);
          _result += roll;

          if (widget.advantageDisadvantage) {
            int secondRoll = Random().nextInt(sides) + 1;
            _secondDiceResults[diceType]!.add(secondRoll);
            _secondResult += secondRoll;
          }
        }
      }

      _result += widget.diceSet.modifier;
      if (widget.advantageDisadvantage) {
        _secondResult += widget.diceSet.modifier;
      }
    });
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _animation,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.diceSet.name +
                    (widget.diceSet.modifier != 0
                        ? ' (调整值: ${widget.diceSet.modifier})'
                        : ''),
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 16),
              if (widget.advantageDisadvantage)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildResultText(
                        _result > _secondResult ? _result : _secondResult, '高'),
                    const SizedBox(width: 16),
                    _buildResultText(
                        _result < _secondResult ? _result : _secondResult, '低'),
                  ],
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildResultText(_result, ''),
                  ],
                ),
              const SizedBox(height: 16),
              _buildDiceResultsDisplay(),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _rollDice,
                child: const Text('重新投掷'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultText(int value, String label) {
    return Column(
      children: [
        Text(
          '$value',
          style: const TextStyle(
              color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
        ),
        if (label.isNotEmpty)
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
      ],
    );
  }

  Widget _buildDiceResultsDisplay() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _diceResults.entries.map((entry) {
        return Column(
          children: [
            Text(
              entry.key,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  FontAwesomeIcons.diceD20,
                  color: Colors.white,
                  size: 16,
                ),
              ],
            ),
            Text(
              entry.value.join(', '),
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            if (widget.advantageDisadvantage)
              Text(
                _secondDiceResults[entry.key]!.join(', '),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
          ],
        );
      }).toList(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// 使用方法：
// showDialog(
//   context: context,
//   builder: (BuildContext context) {
//     return DiceRollPopup(diceSet: yourDiceSet, advantageDisadvantage: true);
//   },
// );
