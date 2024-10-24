import 'package:dnd_character/app/data/character_manager.dart';
import 'package:flutter/material.dart';
import 'package:dnd_character/app/data/character.dart';
import 'package:dnd_character/app/widgets/coin_display_widget.dart';
import 'package:provider/provider.dart';
import 'package:dnd_character/app/widgets/attributes_display_widget.dart';
import 'package:dnd_character/app/widgets/health_bar_widget.dart';
import 'package:dnd_character/app/widgets/experience_bar_widget.dart';
import 'package:dnd_character/app/widgets/race_and_class_widget.dart';
import 'package:dnd_character/app/widgets/combat_stats_widget.dart';
import 'package:dnd_character/app/widgets/dice_bag.dart';
import 'package:dnd_character/app/pages/skill_page.dart';
import 'package:dnd_character/app/pages/backpack_page.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dnd_character/app/widgets/dice_row.dart';
import 'package:path_provider/path_provider.dart';

class CharacterDisplayScreen extends StatefulWidget {
  CharacterDisplayScreen({super.key});

  @override
  _CharacterDisplayScreenState createState() => _CharacterDisplayScreenState();
}

class _CharacterDisplayScreenState extends State<CharacterDisplayScreen> {
  bool _isEditMode = false; // Add a state variable to track edit mode

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = image.name;
      final savedImage =
          await File(image.path).copy('${appDir.path}/$fileName');

      // 删除旧的文件
      if (Provider.of<CharacterManager>(context, listen: false)
          .character
          .avatarUrl
          .isNotEmpty) {
        final oldImage = File(
            Provider.of<CharacterManager>(context, listen: false)
                .character
                .avatarUrl);
        oldImage.deleteSync();
      }

      setState(() {
        // Assuming you have a method to update the character's avatarUrl
        Provider.of<CharacterManager>(context, listen: false)
            .updateCharacter({'avatarUrl': savedImage.path});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('角色展示'),
        actions: [
          IconButton(
            icon: Icon(_isEditMode ? Icons.check : Icons.edit),
            onPressed: () {
              setState(() {
                _isEditMode = !_isEditMode; // Toggle edit mode
              });
            },
          ),
        ],
      ),
      body: Consumer<CharacterManager>(
        builder: (context, manager, child) {
          final Character character = manager.character;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _isEditMode
                        ? _pickImage
                        : null, // Enable tap only in edit mode
                    child: character.avatarUrl.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Builder(
                              builder: (context) {
                                try {
                                  return ClipOval(
                                    child: Image.file(
                                      File(character.avatarUrl),
                                      height: 120,
                                      width: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                } catch (e) {
                                  // Show a SnackBar with an error message
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Failed to load image, displaying default.')),
                                    );
                                  });
                                  // Return a default image
                                  return ClipOval(
                                    child: Image.asset(
                                      'assets/character.jpg',
                                      height: 120,
                                      width: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                }
                              },
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/character.jpg',
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(height: 10),
                  AbsorbPointer(
                    absorbing:
                        !_isEditMode, // Disable interaction when not in edit mode
                    child: CharacterDetailsWidget(
                      currentRace: character.race,
                      currentClass: character.characterClass,
                      currentBackground: character.background,
                      currentAlignment: character.alignment,
                    ),
                  ),
                  const SizedBox(height: 10),
                  AbsorbPointer(
                    absorbing:
                        !_isEditMode, // Disable interaction when not in edit mode
                    child: CombatStatsWidget(
                      armorClass: character.armorClass,
                      initiative: character.initiative,
                      speed: character.speed,
                    ),
                  ),
                  const SizedBox(height: 10),
                  AbsorbPointer(
                    absorbing:
                        !_isEditMode, // Disable interaction when not in edit mode
                    child: AttributesDisplay(attributes: character.attributes),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            HealthBar(
                                currentHitPoints: character.currentHitPoints,
                                maxHitPoints: character.maxHitPoints),
                            const SizedBox(height: 10),
                            ExperienceBar(
                                currentExperience: character.experiencePoints,
                                currentLevel: character.level),
                          ],
                        ),
                      ),
                      CoinDisplayWidget(coin: character.coin)
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SkillExpertiseScreen()));
                        },
                        child: Text('技能专长'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BackpackPage()));
                        },
                        child: Text('背包'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    color: const Color.fromARGB(255, 78, 76, 76),
                    thickness: 2.0,
                  ),
                  const SizedBox(
                      height: 20), // Larger spacing to distinguish boundaries
                  DiceRow(),
                  DiceBagWidget(diceBag: character.diceBag),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
