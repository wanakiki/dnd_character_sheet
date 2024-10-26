// lib/spell_detail_screen.dart
import 'package:flutter/material.dart';
import '../data/spell.dart';
import 'package:provider/provider.dart';
import '../data/character_manager.dart';

class SpellDetailScreen extends StatelessWidget {
  final Spell spell;

  SpellDetailScreen({required this.spell});

  @override
  Widget build(BuildContext context) {
    final characterManager = Provider.of<CharacterManager>(context);
    final isFavorite =
        characterManager.character.favoriteSpells.contains(spell.name);

    void _toggleFavorite() {
      if (isFavorite) {
        characterManager.removeFavoriteSpell(spell.name);
      } else {
        characterManager.addFavoriteSpell(spell.name);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(spell.name),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionCard('基本信息', [
              _buildDetailRow('环阶', spell.level),
              _buildDetailRow('学派', spell.school),
              _buildIconDetailRow('仪式', spell.ritual),
              _buildDetailRow('施法时间', spell.castingTime),
              _buildDetailRow('施法距离', spell.range),
              _buildDetailRow('持续时间', spell.duration),
            ]),
            Divider(),
            _buildSectionCard('施法要求', [
              _buildCombinedIconDetailRow(),
              if (spell.material)
                _buildDetailRow('材料内容', spell.materialComponents),
            ]),
            Divider(),
            _buildSectionCard('法术描述', [
              Text(spell.description, style: _contentTextStyle()),
            ]),
            Divider(),
            _buildSectionCard('其他信息', [
              _buildDetailRow('职业列表', spell.classes.join(', ')),
              _buildDetailRow('出处', spell.source),
              _buildDetailRow('英文名', spell.englishName),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard(String title, List<Widget> children) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: _sectionTitleStyle()),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text('$label: ', style: _labelTextStyle()),
          Expanded(child: Text(value, style: _contentTextStyle())),
        ],
      ),
    );
  }

  Widget _buildIconDetailRow(String label, bool value) {
    return Row(
      children: [
        Text('$label: ', style: _labelTextStyle()),
        Icon(value ? Icons.check_circle : Icons.cancel,
            color: value ? Colors.green : Colors.red),
      ],
    );
  }

  Widget _buildCombinedIconDetailRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: _buildIconDetailRow('言语', spell.verbal)),
          Expanded(child: _buildIconDetailRow('姿势', spell.somatic)),
          Expanded(child: _buildIconDetailRow('材料', spell.material)),
        ],
      ),
    );
  }

  TextStyle _sectionTitleStyle() {
    return TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent);
  }

  TextStyle _labelTextStyle() {
    return TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  }

  TextStyle _contentTextStyle() {
    return TextStyle(fontSize: 16);
  }
}
