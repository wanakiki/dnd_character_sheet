import 'package:dnd_character/app/data/character_manager.dart';
import 'package:flutter/material.dart';
import 'package:dnd_character/app/data/character.dart';
import 'package:dnd_character/app/widgets/coin_display_widget.dart';
import 'package:provider/provider.dart';
import 'package:dnd_character/app/widgets/attributes_display_widget.dart';
import 'package:dnd_character/app/widgets/health_bar_widget.dart';
import 'package:dnd_character/app/widgets/experience_bar_widget.dart';
import 'package:dnd_character/app/widgets/race_and_class_widget.dart';

class CharacterDisplayScreen extends StatelessWidget {
  CharacterDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('角色展示'),
      ),
      body: Consumer<CharacterManager>(
        builder: (context, manager, child) {
          final Character character = manager.character;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 10),
                CharacterDetailsWidget(
                    currentRace: character.race,
                    currentClass: character.characterClass,
                    currentBackground: character.background,
                    currentAlignment: character.alignment),
                Text(
                  '等级: ${character.level}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '经验值: ${character.experiencePoints}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ExperienceBar(
                  currentExperience: character.experiencePoints,
                  currentLevel: character.level,
                ),
                const SizedBox(height: 20),
                // Row(
                //   children: [
                //     Column(
                //       children: [
                //         HealthBar(
                //             currentHitPoints: character.currentHitPoints,
                //             maxHitPoints: character.maxHitPoints),
                //         const SizedBox(height: 10),
                //         ExperienceBar(
                //             currentExperience: character.experiencePoints,
                //             currentLevel: character.level),
                //       ],
                //     ),
                //     const SizedBox(width: 20),
                //     CoinDisplayWidget(coin: character.coin)
                //   ],
                // ),
                Text(
                  '属性:',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Row(
                  children: [
                    AttributesDisplay(attributes: character.attributes),
                    const SizedBox(width: 20),
                    CoinDisplayWidget(coin: character.coin),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  '生命值: ${character.currentHitPoints}/${character.maxHitPoints}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                HealthBar(
                  currentHitPoints: character.currentHitPoints,
                  maxHitPoints: character.maxHitPoints,
                ),
                Text('护甲等级: ${character.armorClass}'),
                Text('敏捷加值: ${character.initiative}'),
                Text('移动速度: ${character.speed}'),
                const SizedBox(height: 20),
                CoinDisplayWidget(coin: character.coin),
                if (character.avatarUrl.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Image.network(character.avatarUrl),
                  ),
                if (character.avatarUrl.isEmpty)
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Placeholder(
                      fallbackHeight: 150,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
