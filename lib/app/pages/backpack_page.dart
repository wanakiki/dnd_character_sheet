import 'package:flutter/material.dart';
import 'package:dnd_character/app/data/character_manager.dart';
import 'package:dnd_character/app/data/items.dart';
import 'package:provider/provider.dart';

class BackpackPage extends StatefulWidget {
  @override
  _BackpackPageState createState() => _BackpackPageState();
}

class _BackpackPageState extends State<BackpackPage> {
  bool _isEditMode = false;
  bool _isDeleteMode = false;

  void _toggleEditMode() {
    setState(() {
      _isEditMode = !_isEditMode;
      _isDeleteMode =
          false; // Ensure delete mode is off when entering edit mode
    });
  }

  void _toggleDeleteMode() {
    setState(() {
      _isDeleteMode = !_isDeleteMode;
      _isEditMode = false; // Ensure edit mode is off when entering delete mode
    });
  }

  void _incrementItemQuantity(BuildContext context, Item item) {
    Provider.of<CharacterManager>(context, listen: false)
        .updateItemQuantity(item, item.quantity + 1);
  }

  void _decrementItemQuantity(BuildContext context, Item item) {
    if (item.quantity > 0) {
      Provider.of<CharacterManager>(context, listen: false)
          .updateItemQuantity(item, item.quantity - 1);
    }
  }

  void _deleteItem(BuildContext context, Item item) {
    Provider.of<CharacterManager>(context, listen: false)
        .deleteItem(item.uniqueId);
  }

  void _editItemDetails(BuildContext context, Item item) {
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
                Provider.of<CharacterManager>(context, listen: false)
                    .updateItem(
                  item.copyWith(
                    name: itemName,
                    quantity: itemQuantity,
                    description: itemDescription,
                  ),
                );
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
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
                if (itemName.isNotEmpty) {
                  Provider.of<CharacterManager>(context, listen: false).addItem(
                    Item(
                      name: itemName,
                      quantity: itemQuantity,
                      description: itemDescription,
                    ),
                  );
                  Navigator.of(context).pop();
                }
              },
            ),
            TextButton(
              child: const Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('背包'),
        actions: [
          IconButton(
            icon: Icon(_isEditMode ? Icons.check : Icons.edit),
            onPressed: _toggleEditMode,
            tooltip: _isEditMode ? 'Finish Editing' : 'Edit',
          ),
          IconButton(
            icon: Icon(_isDeleteMode ? Icons.check : Icons.delete),
            onPressed: _toggleDeleteMode,
            tooltip: _isDeleteMode ? 'Finish Deleting' : 'Delete',
          ),
        ],
      ),
      body: Consumer<CharacterManager>(
        builder: (context, manager, child) {
          final backpack = manager.character.backpack;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: backpack.length,
              itemBuilder: (context, index) {
                final item = backpack[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  child: ListTile(
                    title: Text(item.name),
                    subtitle: Text(item.description),
                    trailing: _isEditMode
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove, color: Colors.red),
                                onPressed: () =>
                                    _decrementItemQuantity(context, item),
                                tooltip: 'Decrease Quantity',
                              ),
                              Text('数量: ${item.quantity}'),
                              IconButton(
                                icon: Icon(Icons.add, color: Colors.green),
                                onPressed: () =>
                                    _incrementItemQuantity(context, item),
                                tooltip: 'Increase Quantity',
                              ),
                            ],
                          )
                        : _isDeleteMode
                            ? IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _deleteItem(context, item),
                                tooltip: 'Delete Item',
                              )
                            : Text('数量: ${item.quantity}'),
                    onLongPress: _isEditMode
                        ? () => _editItemDetails(context, item)
                        : null,
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddItemDialog(context),
        child: const Icon(Icons.add),
        tooltip: '添加新物品',
      ),
    );
  }
}
