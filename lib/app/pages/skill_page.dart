import 'package:flutter/material.dart';
import 'package:dnd_character/app/data/character_manager.dart';
import 'package:provider/provider.dart';
import 'package:dnd_character/app/data/expertise_item.dart';

class SkillExpertiseScreen extends StatefulWidget {
  SkillExpertiseScreen({super.key});

  @override
  _SkillExpertiseScreenState createState() => _SkillExpertiseScreenState();
}

class _SkillExpertiseScreenState extends State<SkillExpertiseScreen> {
  bool _isEditMode = false;

  void _toggleEditMode() {
    setState(() {
      _isEditMode = !_isEditMode;
    });
  }

  void _addSkillOrExpertise(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddSkillOrExpertiseDialog();
      },
    );
  }

  void _deleteSkill(BuildContext context, String skill) {
    Provider.of<CharacterManager>(context, listen: false).deleteSkill(skill);
  }

  void _deleteExpertise(BuildContext context, String expertise) {
    Provider.of<CharacterManager>(context, listen: false)
        .deleteExpertise(expertise);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('技能专长展示'),
          actions: [
            IconButton(
              icon: Icon(_isEditMode ? Icons.check : Icons.edit),
              onPressed: _toggleEditMode,
              tooltip: _isEditMode ? 'Finish Editing' : 'Edit',
            ),
          ],
        ),
        body: Consumer<CharacterManager>(
          builder: (context, manager, child) {
            final skills = manager.character.skills;
            final expertise = manager.character.expertise;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                padding: EdgeInsets.only(bottom: 80), // 为底部浮动按钮留出空间
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: Colors.transparent,
                    ),
                    child: ExpansionTile(
                      title: Text(
                        '技能',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                ),
                      ),
                      initiallyExpanded: true, // 默认展开
                      tilePadding: EdgeInsets.zero,
                      childrenPadding: EdgeInsets.zero,
                      children: skills
                          .map((skill) => Card(
                                margin: EdgeInsets.symmetric(vertical: 4.0),
                                child: ListTile(
                                  title: Text(skill),
                                  trailing: _isEditMode
                                      ? IconButton(
                                          icon: Icon(Icons.delete,
                                              color: Colors.red),
                                          onPressed: () =>
                                              _deleteSkill(context, skill),
                                          tooltip: 'Delete Skill',
                                        )
                                      : null,
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: Colors.transparent, // 去除分隔线颜色
                    ),
                    child: ExpansionTile(
                      title: Text(
                        '非检定相关熟练项/专长',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                      ),
                      tilePadding: EdgeInsets.zero,
                      childrenPadding: EdgeInsets.zero,
                      initiallyExpanded: true, // 默认展开
                      children: expertise
                          .map((exp) => Card(
                                margin: EdgeInsets.symmetric(vertical: 4.0),
                                child: ListTile(
                                  title: Text(exp.name),
                                  subtitle: Text(exp.description),
                                  trailing: _isEditMode
                                      ? IconButton(
                                          icon: Icon(Icons.delete,
                                              color: Colors.red),
                                          onPressed: () => _deleteExpertise(
                                              context, exp.name),
                                          tooltip: 'Delete Expertise',
                                        )
                                      : null,
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: Stack(
          children: [
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: FloatingActionButton(
                heroTag: 'addButton', // Unique heroTag
                onPressed: () => _addSkillOrExpertise(context),
                child: Icon(Icons.add),
                tooltip: 'Add Skill or Expertise',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddSkillOrExpertiseDialog extends StatefulWidget {
  @override
  _AddSkillOrExpertiseDialogState createState() =>
      _AddSkillOrExpertiseDialogState();
}

class _AddSkillOrExpertiseDialogState extends State<AddSkillOrExpertiseDialog> {
  bool _isAddingSkill = true;
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String? _selectedSkill;

  final List<String> _skills = [
    '体质 - 豁免',
    '力量 - 运动',
    '力量 - 豁免',
    '敏捷 - 特技',
    '敏捷 - 巧手',
    '敏捷 - 隐匿',
    '敏捷 - 豁免',
    '智力 - 奥秘',
    '智力 - 历史',
    '智力 - 调查',
    '智力 - 自然',
    '智力 - 宗教',
    '智力 - 豁免',
    '感知 - 驯兽',
    '感知 - 洞悉',
    '感知 - 医药',
    '感知 - 察觉',
    '感知 - 生存',
    '感知 - 豁免',
    '魅力 - 欺瞒',
    '魅力 - 威吓',
    '魅力 - 表演',
    '魅力 - 游说',
    '魅力 - 豁免',
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('添加技能或专长'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: RadioListTile<bool>(
                  title: Text('技能'),
                  value: true,
                  groupValue: _isAddingSkill,
                  onChanged: (value) {
                    setState(() {
                      _isAddingSkill = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<bool>(
                  title: Text('专长'),
                  value: false,
                  groupValue: _isAddingSkill,
                  onChanged: (value) {
                    setState(() {
                      _isAddingSkill = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          if (_isAddingSkill)
            SizedBox(
              width:
                  double.infinity, // Set the width to fill the available space
              child: DropdownButton<String>(
                value: _selectedSkill,
                hint: Text('选择技能'),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedSkill = newValue;
                  });
                },
                items: _skills.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                isExpanded:
                    true, // Ensure the dropdown button expands to fill the width
              ),
            ),
          if (!_isAddingSkill)
            Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: '名称'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: '描述'),
                ),
              ],
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (_isAddingSkill) {
              if (_selectedSkill != null) {
                Provider.of<CharacterManager>(context, listen: false)
                    .addSkill(_selectedSkill!);
              }
            } else {
              if (_nameController.text.isNotEmpty) {
                Provider.of<CharacterManager>(context, listen: false)
                    .addExpertise(
                  ExpertiseItem(
                    name: _nameController.text,
                    description: _descriptionController.text,
                  ),
                );
              }
            }
            Navigator.of(context).pop();
          },
          child: Text('添加'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('取消'),
        ),
      ],
    );
  }
}
