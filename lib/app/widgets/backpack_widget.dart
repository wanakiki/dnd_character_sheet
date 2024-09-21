import 'package:flutter/material.dart';
import 'package:dnd_character/app/data/items.dart';
import 'package:dnd_character/app/data/character_manager.dart';
import 'package:provider/provider.dart';

class BackpackWidget extends StatelessWidget {
  final List<Item> backpack;

  const BackpackWidget({
    Key? key,
    required this.backpack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.all(8),
          child: Stack(
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: backpack.length,
                  itemBuilder: (context, index) {
                    final item = backpack[index];
                    return ListTile(
                      title: Text(item.name,
                          style: Theme.of(context).textTheme.bodySmall),
                      subtitle: Text(item.description),
                      trailing: Text('数量: ${item.quantity}'),
                      onLongPress: () {
                        _showEditDialog(context, item);
                      },
                    );
                  },
                ),
              ),
              Positioned(
                left: -8,
                top: -8,
                child: GestureDetector(
                  onLongPress: () {
                    _showAddItemDialog(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, Item item) {
    String itemName = item.name;
    int itemQuantity = item.quantity;
    String itemDescription = item.description;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('编辑物品: $itemName'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: '物品名称'),
                onChanged: (value) {
                  itemName = value;
                },
                controller: TextEditingController(text: itemName),
              ),
              TextField(
                decoration: InputDecoration(labelText: '数量'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  itemQuantity = int.tryParse(value) ?? itemQuantity;
                },
                controller:
                    TextEditingController(text: itemQuantity.toString()),
              ),
              TextField(
                decoration: InputDecoration(labelText: '描述'),
                onChanged: (value) {
                  itemDescription = value;
                },
                controller: TextEditingController(text: itemDescription),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('应用修改'),
              onPressed: () {
                // 更新物品逻辑
                CharacterManager characterManager =
                    Provider.of<CharacterManager>(context, listen: false);
                characterManager.deleteItem(item.uniqueId); // 删除旧物品
                characterManager.addItem(Item(
                  name: itemName,
                  quantity: itemQuantity,
                  description: itemDescription,
                )); // 添加新物品
                Navigator.of(context).pop();
              },
            ),
            GestureDetector(
              onDoubleTap: () {
                // 双击确认删除
                CharacterManager characterManager =
                    Provider.of<CharacterManager>(context, listen: false);
                characterManager.deleteItem(item.uniqueId);
                Navigator.of(context).pop();
              },
              child: TextButton(
                child: const Text('删除（双击确认）'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('请双击确认删除')),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void _showAddItemDialog(BuildContext context) {
    String itemName = '';
    int itemQuantity = 1;
    String itemDescription = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('添加新物品'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: '物品名称'),
                onChanged: (value) {
                  itemName = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: '数量'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  itemQuantity = int.tryParse(value) ?? itemQuantity;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: '描述'),
                onChanged: (value) {
                  itemDescription = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('添加物品'),
              onPressed: () {
                // 添加新物品逻辑
                if (itemName.isNotEmpty) {
                  CharacterManager characterManager =
                      Provider.of<CharacterManager>(context, listen: false);
                  characterManager.addItem(Item(
                    name: itemName,
                    quantity: itemQuantity,
                    description: itemDescription,
                  ));
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
