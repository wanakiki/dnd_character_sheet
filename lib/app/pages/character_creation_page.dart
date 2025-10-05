import 'package:flutter/material.dart';
import 'creation_steps/race_selection_step.dart';

class CharacterCreationPage extends StatefulWidget {
  const CharacterCreationPage({super.key});

  @override
  State<CharacterCreationPage> createState() => _CharacterCreationPageState();
}

class _CharacterCreationPageState extends State<CharacterCreationPage> {
  int _currentStep = 0;

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
          if (_currentStep < 1) {
            // We only have 1 step for now
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
        steps: [
          Step(
            title: const Text('种族'),
            content: RaceSelectionStep(
              onRaceSelected: (race) {
                // TODO: Handle race selection
              },
            ),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: const Text('职业'),
            content: Container(), // Placeholder for ClassSelectionStep
            isActive: _currentStep >= 1,
          ),
          // More steps will be added here
        ],
      ),
    );
  }
}
