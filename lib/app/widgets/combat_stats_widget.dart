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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatText('护甲等级 (AC)', armorClass),
            SizedBox(width: 8.0),
            _buildStatText('先攻', initiative),
            SizedBox(width: 8.0),
            _buildStatText('移动速度', speed),
          ],
        ),
      ),
    );
  }

  Widget _buildStatText(String label, int value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18.0),
        ),
        Text(
          value.toString(),
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
          title: Text('更新角色属性'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDialogTextField('护甲等级 (AC)', acController),
              SizedBox(height: 16.0),
              _buildDialogTextField('先攻', initiativeController),
              SizedBox(height: 16.0),
              _buildDialogTextField('移动速度', speedController),
            ],
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
              child: Text('确认'),
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
