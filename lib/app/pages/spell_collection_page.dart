import 'package:dnd_character/app/pages/spell_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dnd_character/app/data/character_manager.dart';
import 'package:dnd_character/app/data/spell.dart';
import 'package:dnd_character/app/pages/spell_home.dart';
import 'package:isar/isar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SpellCollectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('法术收藏'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SpellListScreen()),
              );
            },
            tooltip: '搜索和添加法术',
          ),
        ],
      ),
      body: Consumer<CharacterManager>(
        builder: (context, characterManager, child) {
          final favoriteSpells = characterManager.character.favoriteSpells;

          if (favoriteSpells.isEmpty) {
            return Center(
              child: Text('没有收藏的法术'),
            );
          }

          return FutureBuilder<List<Spell>>(
            future: _getFavoriteSpells(context, favoriteSpells),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('加载法术时出错'));
              }

              final spells = snapshot.data!;

              return StaggeredGridView.countBuilder(
                crossAxisCount: 2, // 每行两个法术
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                padding: const EdgeInsets.all(16.0),
                itemCount: spells.length,
                itemBuilder: (context, index) {
                  final spell = spells[index];

                  return Card(
                    margin: EdgeInsets.zero,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SpellDetailScreen(spell: spell),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              spell.name,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8.0),
                            Text('环阶: ${spell.level}'),
                            Text('学派: ${spell.school}'),
                            Text('施法时间: ${spell.castingTime}'),
                            Text('施法距离: ${spell.range}'),
                            Text('持续时间: ${spell.duration}'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
              );
            },
          );
        },
      ),
    );
  }

  Future<List<Spell>> _getFavoriteSpells(
      BuildContext context, List<String> favoriteSpells) async {
    final isar = Provider.of<Isar>(context, listen: false);
    final spells = await isar.spells
        .filter()
        .anyOf(favoriteSpells, (q, String name) => q.nameEqualTo(name))
        .findAll();
    return spells;
  }
}
