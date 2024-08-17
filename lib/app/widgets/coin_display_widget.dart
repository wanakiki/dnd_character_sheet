import 'package:flutter/material.dart';
import 'package:dnd_character/app/data/character_manager.dart';
import 'package:provider/provider.dart';

class CoinDisplayWidget extends StatelessWidget {
  final List<int> coin; // [gold, silver, copper]

  const CoinDisplayWidget({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () => _showEditDialog(context),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.monetization_on, color: Colors.yellow),
                  const SizedBox(width: 8),
                  Text('金币: ${coin[0]}'),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.monetization_on, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text('银币: ${coin[1]}'),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.monetization_on, color: Colors.brown),
                  const SizedBox(width: 8),
                  Text('铜币: ${coin[2]}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    int goldInput = 0;
    int silverInput = 0;
    int copperInput = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('修改金币'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextField(
                context,
                '金币',
                goldInput,
                (value) => goldInput = _parseInput(value),
              ),
              _buildTextField(
                context,
                '银币',
                silverInput,
                (value) => silverInput = _parseInput(value),
              ),
              _buildTextField(
                context,
                '铜币',
                copperInput,
                (value) => copperInput = _parseInput(value),
              ),
              const SizedBox(height: 16),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  _applyTransaction(
                      goldInput, silverInput, copperInput, context);
                  Navigator.of(context).pop();
                },
                child: const Text("获得")),
            TextButton(
                onPressed: () {
                  _applyLoss(goldInput, silverInput, copperInput, context);
                  Navigator.of(context).pop();
                },
                child: const Text("失去")),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('取消'),
            )
          ],
        );
      },
    );
  }

  Widget _buildTextField(
    BuildContext context,
    String label,
    int initialValue,
    Function(String) onChanged,
  ) {
    final TextEditingController controller =
        TextEditingController(text: initialValue.toString());

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        onChanged: onChanged,
      ),
    );
  }

  int _parseInput(String value) {
    return int.tryParse(value) ?? 0;
  }

  void _applyTransaction(
      int goldInput, int silverInput, int copperInput, BuildContext context) {
    if (_validateInput(goldInput, silverInput, copperInput)) {
      int totalCopper = coin[0] * 10000 + coin[1] * 100 + coin[2];
      int newCopper =
          totalCopper + goldInput * 10000 + silverInput * 100 + copperInput;

      List<int> newCoin = [
        newCopper ~/ 10000,
        (newCopper % 10000) ~/ 100,
        newCopper % 100,
      ];

      CharacterManager characterManager =
          Provider.of<CharacterManager>(context, listen: false);
      characterManager
          .updateCharacter(characterManager.character.copyWith(coin: newCoin));
    } else {
      // TODO show the error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('输入错误'),
            content: const Text('请输入有效的数字。'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('确定'),
              ),
            ],
          );
        },
      );
    }
  }

  void _applyLoss(
      int goldInput, int silverInput, int copperInput, BuildContext context) {
    if (_validateInput(goldInput, silverInput, copperInput)) {
      int totalCopper = coin[0] * 10000 + coin[1] * 100 + coin[2];
      int newCopper =
          totalCopper - (goldInput * 10000 + silverInput * 100 + copperInput);

      if (newCopper < 0) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('金钱不足'),
              content: const Text('您的金币、银币或铜币不足以进行此操作。'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('确定'),
                ),
              ],
            );
          },
        );
      } else {
        List<int> newCoin = [
          newCopper ~/ 10000,
          (newCopper % 10000) ~/ 100,
          newCopper % 100,
        ];

        CharacterManager characterManager =
            Provider.of<CharacterManager>(context, listen: false);
        characterManager.updateCharacter(
            characterManager.character.copyWith(coin: newCoin));
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('输入错误'),
            content: const Text('请输入有效的数字。'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('确定'),
              ),
            ],
          );
        },
      );
    }
  }

  bool _validateInput(int goldInput, int silverInput, int copperInput) {
    // Check if the inputs are not negative and at least one of them is not zero
    return goldInput >= 0 &&
        silverInput >= 0 &&
        copperInput >= 0 &&
        (goldInput > 0 || silverInput > 0 || copperInput > 0);
  }
}
