import 'package:flutter/material.dart';

class MonsterPreview extends StatelessWidget {
  final Map<String, dynamic> monster;

  const MonsterPreview({super.key, required this.monster});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 名称和类型
            Text(
              monster['name'] ?? '',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              '${_getSize(monster['size'])} ${monster['type'] is String ? monster['type'] : monster['type']['type']}',
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            const Divider(),

            // 基础属性
            _buildPropertyRow('护甲等级', _getAC(monster['ac'])),
            _buildPropertyRow('生命值', _getHP(monster['hp'])),
            _buildPropertyRow('速度', _getSpeed(monster['speed'])),

            // 属性值
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildAbilityScore('力量', monster['str']),
                  _buildAbilityScore('敏捷', monster['dex']),
                  _buildAbilityScore('体质', monster['con']),
                  _buildAbilityScore('智力', monster['int']),
                  _buildAbilityScore('感知', monster['wis']),
                  _buildAbilityScore('魅力', monster['cha']),
                ],
              ),
            ),

            // 技能和特性
            if (monster['skill'] != null)
              _buildPropertyRow('技能', _getSkills(monster['skill'])),
            if (monster['senses'] != null)
              _buildPropertyRow('感官', (monster['senses'] as List).join('，')),

            // 动作
            if (monster['action'] != null) ...[
              const Divider(),
              const Text('动作',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ..._buildActions(monster['action']),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label：', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildAbilityScore(String name, int score) {
    final modifier = (score - 10) ~/ 2;
    final sign = modifier >= 0 ? '+' : '';

    return Column(
      children: [
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text('$score ($sign$modifier)'),
      ],
    );
  }

  List<Widget> _buildActions(List<dynamic> actions) {
    return actions.map((action) {
      return Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(action['name'],
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(action['entries'].join('\n')),
          ],
        ),
      );
    }).toList();
  }

  String _getSize(List<dynamic> size) {
    final sizeMap = {
      'T': '微型',
      'S': '小型',
      'M': '中型',
      'L': '大型',
      'H': '巨型',
      'G': '超巨型'
    };
    return sizeMap[size[0]] ?? size[0];
  }

  String _getAC(List<dynamic> ac) {
    if (ac[0] is int) return ac[0].toString();
    return '${ac[0]['ac']}${ac[0]['from'] != null ? ' (${ac[0]['from'].join(', ')})' : ''}';
  }

  String _getHP(Map<String, dynamic> hp) {
    return '${hp['average']} (${hp['formula']})';
  }

  String _getSpeed(Map<String, dynamic> speed) {
    return speed.entries.map((e) {
      if (e.value is Map) {
        return '${e.key} ${e.value['number']}尺${e.value['condition'] ?? ''}';
      }
      return '${e.key} ${e.value}尺';
    }).join('，');
  }

  String _getSkills(Map<String, dynamic> skills) {
    return skills.entries.map((e) => '${e.key} ${e.value}').join('，');
  }
}
