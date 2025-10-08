import 'package:dnd_character/app/data/character.dart';
import 'package:dnd_character/app/data/character_manager.dart';
import 'creation_steps/attribute_editing_step.dart';
import 'creation_steps/character_description_step.dart';
import 'creation_steps/class_selection_step.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'creation_steps/race_selection_step.dart';

class CharacterCreationPage extends StatefulWidget {
  const CharacterCreationPage({super.key});

  @override
  State<CharacterCreationPage> createState() => _CharacterCreationPageState();
}

class _CharacterCreationPageState extends State<CharacterCreationPage> {
  int _currentStep = 0;
  String? _selectedRace;
  String? _selectedClass;
  Map<String, int> _attributes = {};
  String? _characterName;
  int? _characterAge;
  String? _selectedAlignment;
  String? _selectedBackground;

  void _saveCharacter() {
    if (_characterName == null ||
        _characterAge == null ||
        _selectedRace == null ||
        _selectedClass == null ||
        _selectedAlignment == null ||
        _selectedBackground == null ||
        _attributes.length < 6) {
      // Optionally show a dialog or snackbar if not all fields are filled
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请填写所有角色信息。')),
      );
      return;
    }

    final newCharacter = Character(
      name: _characterName!,
      age: _characterAge!,
      race: _selectedRace!,
      characterClass: _selectedClass!,
      background: _selectedBackground!,
      alignment: _selectedAlignment!,
      attributes: [
        _attributes['力量']!,
        _attributes['敏捷']!,
        _attributes['体质']!,
        _attributes['智力']!,
        _attributes['感知']!,
        _attributes['魅力']!,
      ],
      // Default values for other fields, or calculate them based on selections
      level: 1,
      experiencePoints: 0,
      currentHitPoints: 10, // Placeholder, should be calculated
      maxHitPoints: 10, // Placeholder, should be calculated
      armorClass: 10, // Placeholder, should be calculated
      initiative: 0, // Placeholder, should be calculated
      speed: 30, // Placeholder, should be calculated
      coin: [0, 0, 0],
    );

    Provider.of<CharacterManager>(context, listen: false)
        .addCharacter(newCharacter);

    Navigator.pop(context); // Go back to the previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('创建你的角色'),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep == 3) {
            _saveCharacter();
          } else {
            setState(() {
              _currentStep += 1;
            });
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
        controlsBuilder: (context, details) {
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              children: <Widget>[
                if (_currentStep != 0)
                  TextButton(
                    onPressed: details.onStepCancel,
                    child: const Text('上一步'),
                  ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: details.onStepContinue,
                  child: Text(_currentStep == 3 ? '完成' : '下一步'),
                ),
              ],
            ),
          );
        },
        steps: [
          Step(
            title: const Text('种族'),
            content: RaceSelectionStep(
              onRaceSelected: (race) {
                setState(() {
                  _selectedRace = race;
                });
              },
            ),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: const Text('职业'),
            content: ClassSelectionStep(
              onClassSelected: (className) {
                setState(() {
                  _selectedClass = className;
                });
              },
            ),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: const Text('属性'),
            content: AttributeEditingStep(
              selectedRace: _selectedRace,
              onAttributesChanged: (attributes) {
                setState(() {
                  _attributes = attributes;
                });
              },
            ),
            isActive: _currentStep >= 2,
          ),
          Step(
            title: const Text('描述'),
            content: CharacterDescriptionStep(
              onDescriptionChanged: (name, age, alignment, background) {
                setState(() {
                  _characterName = name;
                  _characterAge = age;
                  _selectedAlignment = alignment;
                  _selectedBackground = background;
                });
              },
            ),
            isActive: _currentStep >= 3,
          ),
        ],
      ),
    );
  }
}
