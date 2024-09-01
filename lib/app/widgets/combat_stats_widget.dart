import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dnd_character/app/data/character_manager.dart';

class CombatStatsWidget extends StatelessWidget {
  final int armorClass;
  final int initiative;
  final int speed;

  const CombatStatsWidget({
    Key? key,
    required this.armorClass,
    required this.initiative,
    required this.speed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showEditDialog(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatText(context, '护甲等级 (AC)', armorClass),
          _buildStatText(context, '先攻', initiative),
          _buildStatText(context, '移动速度', speed),
        ],
      ),
    );
  }

  Widget _buildStatText(BuildContext context, String label, int value) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          value.toString(),
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  void _showEditDialog(BuildContext context) {
    final TextEditingController acController =
        TextEditingController(text: armorClass.toString());
    final TextEditingController initiativeController =
        TextEditingController(text: initiative.toString());
    final TextEditingController speedController =
        TextEditingController(text: speed.toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('更新角色属性', style: Theme.of(context).textTheme.titleLarge),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDialogTextField('护甲等级 (AC)', acController),
                SizedBox(height: 8.0),
                _buildDialogTextField('先攻', initiativeController),
                SizedBox(height: 8.0),
                _buildDialogTextField('移动速度', speedController),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('取消', style: Theme.of(context).textTheme.labelLarge),
            ),
            TextButton(
              onPressed: () {
                final int newAC = int.tryParse(acController.text) ?? armorClass;
                final int newInitiative =
                    int.tryParse(initiativeController.text) ?? initiative;
                final int newSpeed =
                    int.tryParse(speedController.text) ?? speed;

                CharacterManager characterManager =
                    Provider.of<CharacterManager>(context, listen: false);
                characterManager.updateCharacter(
                  characterManager.character.copyWith(
                    armorClass: newAC,
                    initiative: newInitiative,
                    speed: newSpeed,
                  ),
                );

                Navigator.of(context).pop();
              },
              child: Text('确认', style: Theme.of(context).textTheme.labelLarge),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDialogTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: label),
    );
  }
}
