import 'package:flutter/material.dart';
import 'package:dnd_character/app/data/diceset.dart';
import 'dice_roll.dart';
import 'package:dnd_character/app/data/character_manager.dart';
import 'package:provider/provider.dart';

class DiceBagWidget extends StatelessWidget {
  final List<DiceSet> diceBag;

  const DiceBagWidget({
    Key? key,
    required this.diceBag,
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
                height: 200, // 设置一个固定高度，避免布局问题
                child: ListView.builder(
                  itemCount: diceBag.length,
                  itemBuilder: (context, index) {
                    final diceSet = diceBag[index];
                    return ListTile(
                      title: Text(diceSet.name,
                          style: Theme.of(context).textTheme.bodySmall),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.casino),
                            onPressed: () {
                              // 普通投掷逻辑
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return DiceRollPopup(diceSet: diceSet);
                                },
                              );
                            },
                            tooltip: '普通投掷',
                          ),
                          IconButton(
                            icon: Stack(
                              children: [
                                const Icon(Icons.casino),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.casino, size: 12),
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {
                              // 优劣投掷逻辑
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return DiceRollPopup(
                                    diceSet: diceSet,
                                    advantageDisadvantage: true,
                                  );
                                },
                              );
                            },
                            tooltip: '优劣投掷',
                          ),
                        ],
                      ),
                      onLongPress: () {
                        // 长按条目，弹出修改或删除的对话框
                        _showEditDialog(context, diceSet);
                      },
                    );
                  },
                ),
              ),
              Positioned(
                left: -8,
                top: -8,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DiceRollPopup(
                          diceSet: DiceSet.standard(),
                          advantageDisadvantage: false,
                        );
                      },
                    );
                  },
                  onDoubleTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DiceRollPopup(
                          diceSet: DiceSet.standard(),
                          advantageDisadvantage: true,
                        );
                      },
                    );
                  },
                  onLongPress: () {
                    _showEditDialog(context, DiceSet.standard());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.casino,
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

  // 新增的函数，用于处理长按操作
  void _showEditDialog(BuildContext context, DiceSet diceSet) {
    // 初始化骰子数量
    List<int> dices = diceSet.dices;
    int d4Count = dices[0];
    int d6Count = dices[1];
    int d8Count = dices[2];
    int d10Count = dices[3];
    int d12Count = dices[4];
    int d20Count = dices[5];

    // 初始化骰子组名称
    String diceSetName = diceSet.name;

    // 初始化调整值
    int modifier = diceSet.modifier;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('修改骰子组: $diceSetName'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 显示和修改骰子组名称的输入框
                  TextField(
                    decoration: InputDecoration(labelText: '新的骰子组名称'),
                    onChanged: (value) {
                      setState(() {
                        diceSetName = value;
                      });
                    },
                  ),
                  // 显示和修改骰子数量的输入框
                  _buildDiceCountRow('D4', d4Count, (value) {
                    setState(() {
                      d4Count = value;
                    });
                  }),
                  _buildDiceCountRow('D6', d6Count, (value) {
                    setState(() {
                      d6Count = value;
                    });
                  }),
                  _buildDiceCountRow('D8', d8Count, (value) {
                    setState(() {
                      d8Count = value;
                    });
                  }),
                  _buildDiceCountRow('D10', d10Count, (value) {
                    setState(() {
                      d10Count = value;
                    });
                  }),
                  _buildDiceCountRow('D12', d12Count, (value) {
                    setState(() {
                      d12Count = value;
                    });
                  }),
                  _buildDiceCountRow('D20', d20Count, (value) {
                    setState(() {
                      d20Count = value;
                    });
                  }),
                  // 显示和修改调整值的输入框
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('调整值'),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                modifier--;
                              });
                            },
                          ),
                          Text('$modifier'),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                modifier++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              child: const Text('应用修改'),
              onPressed: () {
                // 更新骰子组的逻辑
                if (diceSetName == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('请输入有效的名称')),
                  );
                  return;
                }
                CharacterManager characterManager =
                    Provider.of<CharacterManager>(context, listen: false);

                // 删除同名的骰子组
                characterManager.deleteDiceSet(diceSet.name);
                // 创建新的骰子组并添加

                DiceSet updatedDiceSet = DiceSet(
                  name: diceSetName,
                  dices: [
                    d4Count,
                    d6Count,
                    d8Count,
                    d10Count,
                    d12Count,
                    d20Count
                  ],
                  modifier: modifier,
                );

                characterManager.addDiceSet(updatedDiceSet);

                Navigator.of(context).pop();
              },
            ),
            GestureDetector(
              onDoubleTap: () {
                // 双击确认删除
                CharacterManager characterManager =
                    Provider.of<CharacterManager>(context, listen: false);
                characterManager.deleteDiceSet(diceSet.name);
                Navigator.of(context).pop();
              },
              child: TextButton(
                child: const Text('删除（双击确认）'),
                onPressed: () {
                  // 提示用户双击确认删除
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

  // 辅助函数，用于构建骰子数量的行
  Widget _buildDiceCountRow(String label, int count, Function(int) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () => onChanged(count > 0 ? count - 1 : 0),
            ),
            Text('$count'),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => onChanged(count + 1),
            ),
          ],
        ),
      ],
    );
  }
}
