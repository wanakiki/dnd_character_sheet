import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dnd_character/app/data/character_manager.dart';

class AttributeCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final int value;

  const AttributeCard(
      {required this.name, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    final int modifier = (value - 10) ~/ 2; // 骰子加成点数的计算

    return SizedBox(
      height: 100, // Add the desired height here
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: InkWell(
          onTap: () => _showEditDialog(context),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(icon, size: 28.0),
                    const SizedBox(height: 8.0),
                    Text(
                      name,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '属性值: $value',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      '加成: ${modifier >= 0 ? '+' : ''}$modifier',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    int currentValue = value;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('修改 $name'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      if (currentValue > 0) {
                        setState(() {
                          currentValue--;
                        });
                      }
                    },
                  ),
                  Text('$currentValue'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        currentValue++;
                      });
                    },
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () {
                Provider.of<CharacterManager>(context, listen: false)
                    .updateAttribute(name, currentValue);
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

class AttributesDisplay extends StatelessWidget {
  final Map<String, int> attributes;

  const AttributesDisplay({required this.attributes});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: attributes.entries.map((entry) {
        return AttributeCard(
          name: entry.key,
          icon: _getIconForAttribute(entry.key),
          value: entry.value,
        );
      }).toList(),
    );
  }

  IconData _getIconForAttribute(String attributeName) {
    switch (attributeName) {
      case '力量':
        return Icons.fitness_center;
      case '敏捷':
        return Icons.directions_run;
      case '体质':
        return Icons.health_and_safety;
      case '智力':
        return Icons.school;
      case '感知':
        return Icons.visibility;
      case '魅力':
        return Icons.mood;
      default:
        return Icons.help;
    }
  }
}
