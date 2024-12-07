import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dnd_character/app/data/character_manager.dart';
import 'package:dnd_character/app/data/consumable.dart';

class ConsumableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterManager>(
      builder: (context, manager, child) {
        final consumables = manager.character.consumables;

        return SingleChildScrollView(
          child: Column(
            children: [
              // Divider(
              //   color: const Color.fromARGB(255, 134, 134, 134),
              //   thickness: 2.0,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: manager.triggerShortRest,
                    child: Text('短休'),
                  ),
                  ElevatedButton(
                    onPressed: manager.triggerLongRest,
                    child: Text('长休'),
                  ),
                  ElevatedButton(
                    onPressed: () => _showAddConsumableDialog(context),
                    child: Text('添加消耗品'),
                  ),
                ],
              ),
              Wrap(
                spacing: 4.0, // Reduced space between items
                runSpacing: 4.0, // Reduced space between lines
                children: consumables.map((consumable) {
                  return GestureDetector(
                    onTap: () {
                      consumable.decrease();
                      manager.updateConsumable(consumable);
                    },
                    onDoubleTap: () {
                      consumable.increase();
                      manager.updateConsumable(consumable);
                    },
                    onLongPress: () {
                      _showEditConsumableDialog(context, consumable, manager);
                    },
                    child: Card(
                      elevation: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 6.0),
                        constraints: BoxConstraints(minWidth: 80.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              consumable.name,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '${consumable.currentCount}/${consumable.maxCount}',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              Divider(
                color: const Color.fromARGB(255, 184, 184, 184),
                thickness: 2.0,
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAddConsumableDialog(BuildContext context) {
    String name = '';
    int maxCount = 0;
    int shortRestRecovery = 0;
    int longRestRecovery = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('添加消耗品'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: '名称'),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: '最大数量'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  maxCount = int.tryParse(value) ?? 0;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: '短休恢复量'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  shortRestRecovery = int.tryParse(value) ?? 0;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: '长休恢复量'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  longRestRecovery = int.tryParse(value) ?? 0;
                },
              ),
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
                if (name.isNotEmpty) {
                  final newConsumable = Consumable(
                    name: name,
                    currentCount: maxCount,
                    maxCount: maxCount,
                    shortRestRecovery: shortRestRecovery,
                    longRestRecovery: longRestRecovery,
                  );
                  Provider.of<CharacterManager>(context, listen: false)
                      .addConsumable(newConsumable);
                  Navigator.of(context).pop();
                }
              },
              child: Text('添加'),
            ),
          ],
        );
      },
    );
  }

  void _showEditConsumableDialog(
      BuildContext context, Consumable consumable, CharacterManager manager) {
    String name = consumable.name;
    int maxCount = consumable.maxCount;
    int shortRestRecovery = consumable.shortRestRecovery;
    int longRestRecovery = consumable.longRestRecovery;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('编辑消耗品'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: '名称'),
                onChanged: (value) {
                  name = value;
                },
                controller: TextEditingController(text: name),
              ),
              TextField(
                decoration: InputDecoration(labelText: '最大数量'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  maxCount = int.tryParse(value) ?? maxCount;
                },
                controller: TextEditingController(text: maxCount.toString()),
              ),
              TextField(
                decoration: InputDecoration(labelText: '短休恢复量'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  shortRestRecovery = int.tryParse(value) ?? shortRestRecovery;
                },
                controller:
                    TextEditingController(text: shortRestRecovery.toString()),
              ),
              TextField(
                decoration: InputDecoration(labelText: '长休恢复量'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  longRestRecovery = int.tryParse(value) ?? longRestRecovery;
                },
                controller:
                    TextEditingController(text: longRestRecovery.toString()),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (name.isNotEmpty) {
                  consumable.name = name;
                  consumable.maxCount = maxCount;
                  consumable.shortRestRecovery = shortRestRecovery;
                  consumable.longRestRecovery = longRestRecovery;
                  manager.updateConsumable(consumable);
                  Navigator.of(context).pop();
                }
              },
              child: Text('保存'),
            ),
            GestureDetector(
              onDoubleTap: () {
                manager.deleteConsumable(consumable);
                Navigator.of(context).pop();
              },
              child: Text(
                '删除(双击)',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
