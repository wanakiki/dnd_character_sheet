// 4 6 8 10 12 20
import 'package:flutter/material.dart';
import 'dart:math';

class DiceRow extends StatefulWidget {
  @override
  _DiceRowState createState() => _DiceRowState();
}

class _DiceRowState extends State<DiceRow> {
  final Random _random = Random();
  final List<int> _diceTypes = [4, 6, 8, 10, 12, 20];
  late List<int> _currentValues;

  @override
  void initState() {
    super.initState();
    _currentValues = List<int>.generate(
        _diceTypes.length, (index) => _rollDice(_diceTypes[index]));
  }

  int _rollDice(int sides) {
    return _random.nextInt(sides) + 1;
  }

  void _rollAllDice() {
    setState(() {
      _currentValues = List<int>.generate(
          _diceTypes.length, (index) => _rollDice(_diceTypes[index]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _diceTypes.sublist(0, 3).asMap().entries.map((entry) {
            int index = entry.key;
            int sides = entry.value;
            return ElevatedButton(
              onPressed: () {
                setState(() {
                  _currentValues[index] = _rollDice(sides);
                });
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Column(
                children: [
                  Text('D$sides'),
                  Text('${_currentValues[index]}'),
                ],
              ),
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _diceTypes.sublist(3).asMap().entries.map((entry) {
            int index = entry.key + 3;
            int sides = entry.value;
            return ElevatedButton(
              onPressed: () {
                setState(() {
                  _currentValues[index] = _rollDice(sides);
                });
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Column(
                children: [
                  Text('D$sides'),
                  Text('${_currentValues[index]}'),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
