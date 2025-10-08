import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CombatParticipant {
  final String name;
  final int initiative;
  int currentHp;
  int maxHp;
  List<String> conditions; // 存储状态效果，如"中毒"，"昏迷"等
  final bool isPlayer; // 区分玩家角色和NPC/怪物

  CombatParticipant({
    required this.name,
    required this.initiative,
    required this.currentHp,
    required this.maxHp,
    this.conditions = const [],
    this.isPlayer = false,
  });
}

class CombatPreset {
  final String name;
  final List<CombatParticipant> participants;
  final String description;

  CombatPreset({
    required this.name,
    required this.participants,
    this.description = '',
  });
}

class InitiativeOrderPage extends StatefulWidget {
  @override
  _InitiativeOrderPageState createState() => _InitiativeOrderPageState();
}

class _InitiativeOrderPageState extends State<InitiativeOrderPage> {
  List<CombatParticipant> participants = [];
  List<CombatPreset> monsterGroups = [];
  List<CombatPreset> playerGroups = [];
  int currentTurnIndex = 0;
  int roundCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('战斗轮次 - 第$roundCount轮'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _nextRound,
            tooltip: '下一轮',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                '战斗管理器',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ExpansionTile(
              title: Text('玩家队伍预设'),
              children: [
                ...playerGroups.map((group) => ListTile(
                      title: Text(group.name),
                      subtitle: Text(group.description),
                      trailing: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => _addPresetToParticipants(group),
                      ),
                    )),
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text('创建新玩家队伍'),
                  onTap: () => _showCreatePresetDialog(true),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('怪物队伍预设'),
              children: [
                ...monsterGroups.map((group) => ListTile(
                      title: Text(group.name),
                      subtitle: Text(group.description),
                      trailing: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => _addPresetToParticipants(group),
                      ),
                    )),
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text('创建新怪物队伍'),
                  onTap: () => _showCreatePresetDialog(false),
                ),
              ],
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.save),
              title: Text('保存当前战斗'),
              onTap: _saveCurrentBattle,
            ),
            ListTile(
              leading: Icon(Icons.restore),
              title: Text('加载已保存的战斗'),
              onTap: _loadSavedBattle,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ReorderableListView.builder(
              itemCount: participants.length,
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) newIndex--;
                  final item = participants.removeAt(oldIndex);
                  participants.insert(newIndex, item);
                  // 调整当前行动者的索引
                  if (currentTurnIndex == oldIndex) {
                    currentTurnIndex = newIndex;
                  }
                });
              },
              itemBuilder: (context, index) {
                final participant = participants[index];
                return _buildParticipantCard(participant, index);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddParticipantDialog(
          context,
          onAdd: null,
          isPlayer: false,
        ),
        child: Icon(Icons.add),
        tooltip: '添加参与者',
      ),
    );
  }

  Widget _buildParticipantCard(CombatParticipant participant, int index) {
    final bool isCurrentTurn = index == currentTurnIndex;

    return Card(
      key: ValueKey(participant.name),
      elevation: isCurrentTurn ? 8.0 : 1.0,
      color: isCurrentTurn ? Colors.blue.shade100 : null,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: participant.isPlayer ? Colors.blue : Colors.red,
          child: Text(participant.name[0]),
        ),
        title: Row(
          children: [
            Text(participant.name),
            SizedBox(width: 8),
            if (isCurrentTurn) Icon(Icons.play_arrow, color: Colors.blue),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('先攻值: ${participant.initiative}'),
            Text('生命值: ${participant.currentHp}/${participant.maxHp}'),
            if (participant.conditions.isNotEmpty)
              Text('状态: ${participant.conditions.join(", ")}'),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => _showEditParticipantDialog(context, index),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _removeParticipant(index),
            ),
          ],
        ),
      ),
    );
  }

  /*
  void _showAddParticipantDialog(BuildContext context) {
    String name = '';
    int initiative = 0;
    int maxHp = 0;
    bool isPlayer = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('添加参与者'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: '名称'),
                  onChanged: (value) => name = value,
                ),
                TextField(
                  decoration: InputDecoration(labelText: '先攻值'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => initiative = int.tryParse(value) ?? 0,
                ),
                TextField(
                  decoration: InputDecoration(labelText: '最大生命值'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => maxHp = int.tryParse(value) ?? 0,
                ),
                CheckboxListTile(
                  title: Text('玩家角色'),
                  value: isPlayer,
                  onChanged: (bool? value) {
                    isPlayer = value ?? false;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('取消'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('添加'),
              onPressed: () {
                if (name.isNotEmpty && maxHp > 0) {
                  setState(() {
                    participants.add(CombatParticipant(
                      name: name,
                      initiative: initiative,
                      currentHp: maxHp,
                      maxHp: maxHp,
                      isPlayer: isPlayer,
                    ));
                    // 按先攻值排序
                    participants
                        .sort((a, b) => b.initiative.compareTo(a.initiative));
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
  */

  void _showEditParticipantDialog(BuildContext context, int index) {
    final participant = participants[index];
    int newCurrentHp = participant.currentHp;
    List<String> conditions = List.from(participant.conditions);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('编辑 ${participant.name}'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: '当前生命值'),
                  keyboardType: TextInputType.number,
                  controller:
                      TextEditingController(text: newCurrentHp.toString()),
                  onChanged: (value) =>
                      newCurrentHp = int.tryParse(value) ?? newCurrentHp,
                ),
                // 添加状态效果的输入框
                TextField(
                  decoration: InputDecoration(
                    labelText: '状态效果（用逗号分隔）',
                    hintText: '中毒,昏迷',
                  ),
                  controller: TextEditingController(text: conditions.join(',')),
                  onChanged: (value) {
                    conditions = value
                        .split(',')
                        .map((e) => e.trim())
                        .where((e) => e.isNotEmpty)
                        .toList();
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('取消'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('保存'),
              onPressed: () {
                setState(() {
                  participants[index] = CombatParticipant(
                    name: participant.name,
                    initiative: participant.initiative,
                    currentHp: newCurrentHp,
                    maxHp: participant.maxHp,
                    conditions: conditions,
                    isPlayer: participant.isPlayer,
                  );
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _removeParticipant(int index) {
    setState(() {
      participants.removeAt(index);
      if (currentTurnIndex >= participants.length) {
        currentTurnIndex = 0;
      }
    });
  }

  void _nextRound() {
    setState(() {
      currentTurnIndex++;
      if (currentTurnIndex >= participants.length) {
        currentTurnIndex = 0;
        roundCount++;
      }
    });
  }

  void _showCreatePresetDialog(bool isPlayerGroup) {
    String name = '';
    String description = '';
    List<CombatParticipant> groupParticipants = [];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('创建${isPlayerGroup ? "玩家" : "怪物"}队伍预设'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: '预设名称'),
                  onChanged: (value) => name = value,
                ),
                TextField(
                  decoration: InputDecoration(labelText: '描述'),
                  onChanged: (value) => description = value,
                ),
                SizedBox(height: 16),
                Text('队伍成员'),
                ...groupParticipants.map((p) => ListTile(
                      title: Text(p.name),
                      trailing: IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            groupParticipants.remove(p);
                          });
                        },
                      ),
                    )),
                TextButton(
                  onPressed: () {
                    _showAddParticipantDialog(
                      context,
                      onAdd: (participant) {
                        if (participant != null) {
                          setState(() {
                            groupParticipants.add(participant);
                          });
                        }
                      },
                      isPlayer: isPlayerGroup,
                    );
                  },
                  child: Text('添加成员'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('取消'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('保存预设'),
              onPressed: () {
                if (name.isNotEmpty && groupParticipants.isNotEmpty) {
                  setState(() {
                    final preset = CombatPreset(
                      name: name,
                      description: description,
                      participants: groupParticipants,
                    );
                    if (isPlayerGroup) {
                      playerGroups.add(preset);
                    } else {
                      monsterGroups.add(preset);
                    }
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _showAddParticipantDialog(
    BuildContext context, {
    void Function(CombatParticipant)? onAdd,
    bool isPlayer = false,
  }) {
    String name = '';
    int initiative = 0;
    int maxHp = 0;
    bool localIsPlayer = isPlayer;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text('添加参与者'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: '名称'),
                    onChanged: (value) => name = value,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: '先攻值'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => initiative = int.tryParse(value) ?? 0,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: '最大生命值'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => maxHp = int.tryParse(value) ?? 0,
                  ),
                  CheckboxListTile(
                    title: Text('玩家角色'),
                    value: localIsPlayer,
                    onChanged: (bool? value) {
                      setState(() {
                        localIsPlayer = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text('取消'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text('添加'),
                onPressed: () {
                  if (name.isNotEmpty && maxHp > 0) {
                    final participant = CombatParticipant(
                      name: name,
                      initiative: initiative,
                      currentHp: maxHp,
                      maxHp: maxHp,
                      isPlayer: localIsPlayer,
                    );

                    if (onAdd != null) {
                      onAdd(participant);
                    } else {
                      this.setState(() {
                        participants.add(participant);
                        participants.sort(
                            (a, b) => b.initiative.compareTo(a.initiative));
                      });
                    }
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
        });
      },
    );
  }

  void _addPresetToParticipants(CombatPreset preset) {
    setState(() {
      participants.addAll(preset.participants);
      participants.sort((a, b) => b.initiative.compareTo(a.initiative));
    });
    Navigator.pop(context); // 关闭抽屉
  }

  void _saveCurrentBattle() {
    // TODO: 实现保存当前战斗状态到本地存储
    Navigator.pop(context);
  }

  void _loadSavedBattle() {
    // TODO: 实现从本地存储加载战斗状态
    Navigator.pop(context);
  }
}
