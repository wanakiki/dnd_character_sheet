import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dnd_character/app/data/character_manager.dart';

class AttributeCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final int value;

  const AttributeCard({
    Key? key,
    required this.name,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int modifier = value >= 10 ? (value - 10) ~/ 2 : (value - 11) ~/ 2;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
      child: InkWell(
        onTap: () => _showEditDialog(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon,
                        size: 14.0, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 2.0),
                    Flexible(
                      child: Text(
                        name,
                        style: textTheme.bodySmall?.copyWith(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$value',
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '${modifier >= 0 ? '+' : ''}$modifier',
                    style: textTheme.bodySmall?.copyWith(fontSize: 10),
                  ),
                ],
              ),
            ],
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      if (currentValue > 0) {
                        setState(() => currentValue--);
                      }
                    },
                  ),
                  Text('$currentValue',
                      style: Theme.of(context).textTheme.headlineSmall),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => setState(() => currentValue++),
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('取消'),
            ),
            ElevatedButton(
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
  final List<int> attributes;

  const AttributesDisplay({Key? key, required this.attributes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.0,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 0.0,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: attributes.length,
      itemBuilder: (context, index) {
        final entry = attributes[index];
        return AttributeCard(
          name: _getAttributeName(index),
          icon: _getIconForAttribute(_getAttributeName(index)),
          value: entry,
        );
      },
    );
  }

  String _getAttributeName(int index) {
    switch (index) {
      case 0:
        return '力量';
      case 1:
        return '敏捷';
      case 2:
        return '体质';
      case 3:
        return '智力';
      case 4:
        return '感知';
      case 5:
        return '魅力';
      default:
        return '未知';
    }
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
        return Icons.help_outline;
    }
  }
}
