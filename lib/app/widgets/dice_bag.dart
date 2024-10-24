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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent, // 去除分隔线颜色
        ),
        child: ExpansionTile(
          title: Text(
            '骰子袋',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
          ),
          initiallyExpanded: true,
          children: [
            ...diceBag.map((diceSet) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                child: ListTile(
                  title: Text(diceSet.name,
                      style: Theme.of(context).textTheme.bodySmall),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.casino),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return DiceRollPopup(diceSet: diceSet);
                            },
                          );
                        },
                        tooltip: '掷骰子',
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
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.casino, size: 12),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
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
                        tooltip: '优势/劣势掷骰子',
                      ),
                    ],
                  ),
                  onLongPress: () {
                    _showEditDialog(context, diceSet);
                  },
                ),
              );
            }).toList(),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('添加骰子组'),
                onPressed: () {
                  _addDiceSet(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

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
          content: SingleChildScrollView(
            child: StatefulBuilder(
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

  void _addDiceSet(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String diceSetName = '';
        List<int> dices = List.filled(6, 0); // Initialize with zero dice
        int modifier = 0;

        return AlertDialog(
          title: const Text('添加新骰子组'),
          content: SingleChildScrollView(
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(labelText: '骰子组名称'),
                      onChanged: (value) {
                        setState(() {
                          diceSetName = value;
                        });
                      },
                    ),
                    _buildDiceCountRow('D4', dices[0], (value) {
                      setState(() {
                        dices[0] = value;
                      });
                    }),
                    _buildDiceCountRow('D6', dices[1], (value) {
                      setState(() {
                        dices[1] = value;
                      });
                    }),
                    _buildDiceCountRow('D8', dices[2], (value) {
                      setState(() {
                        dices[2] = value;
                      });
                    }),
                    _buildDiceCountRow('D10', dices[3], (value) {
                      setState(() {
                        dices[3] = value;
                      });
                    }),
                    _buildDiceCountRow('D12', dices[4], (value) {
                      setState(() {
                        dices[4] = value;
                      });
                    }),
                    _buildDiceCountRow('D20', dices[5], (value) {
                      setState(() {
                        dices[5] = value;
                      });
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('调整值'),
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
          ),
          actions: [
            TextButton(
              child: const Text('添加'),
              onPressed: () {
                if (diceSetName.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('请输入有效的名称')),
                  );
                  return;
                }

                CharacterManager characterManager =
                    Provider.of<CharacterManager>(context, listen: false);

                DiceSet newDiceSet = DiceSet(
                  name: diceSetName,
                  dices: dices,
                  modifier: modifier,
                );

                characterManager.addDiceSet(newDiceSet);

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
}
