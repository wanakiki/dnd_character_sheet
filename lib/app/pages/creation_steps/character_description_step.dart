import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter_markdown/flutter_markdown.dart';

class CharacterDescriptionStep extends StatefulWidget {
  final Function(String name, int age, String alignment, String background)
      onDescriptionChanged;

  const CharacterDescriptionStep(
      {super.key, required this.onDescriptionChanged});

  @override
  State<CharacterDescriptionStep> createState() =>
      _CharacterDescriptionStepState();
}

class _CharacterDescriptionStepState extends State<CharacterDescriptionStep> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String? _selectedAlignment;
  String? _selectedBackground;
  String _backgroundDescription = '';

  Map<String, String> _backgrounds =
      {}; // Map background name to its full asset path

  final List<String> _alignmentOptions = [
    '守序善良',
    '中立善良',
    '混乱善良',
    '守序中立',
    '绝对中立',
    '混乱中立',
    '守序邪恶',
    '中立邪恶',
    '混乱邪恶'
  ];

  @override
  void initState() {
    super.initState();
    _loadBackgrounds();
    _nameController.addListener(_onChanged);
    _ageController.addListener(_onChanged);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _onChanged() {
    widget.onDescriptionChanged(
      _nameController.text,
      int.tryParse(_ageController.text) ?? 0,
      _selectedAlignment ?? '',
      _selectedBackground ?? '',
    );
  }

  Future<void> _loadBackgrounds() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final Map<String, String> backgroundAssets = {};
    for (final key in manifestMap.keys) {
      if (key.startsWith('assets/render_md/background/') &&
          key.endsWith('.md')) {
        String fileName = key.split('/').last;
        String backgroundName = fileName.substring(0, fileName.length - 3);
        backgroundAssets[backgroundName] = key; // Map name to full path
      }
    }

    setState(() {
      _backgrounds = backgroundAssets;
    });
  }

  Future<void> _loadBackgroundDescription(String backgroundName) async {
    final String? assetPath = _backgrounds[backgroundName];
    if (assetPath == null) {
      setState(() {
        _backgroundDescription = '无法找到资源路径。';
      });
      return;
    }

    try {
      final description = await rootBundle.loadString(assetPath);
      setState(() {
        _backgroundDescription = description;
      });
    } catch (e) {
      setState(() {
        _backgroundDescription = '无法加载背景描述。请检查文件是否存在或应用配置是否正确。';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('角色名称:', style: Theme.of(context).textTheme.titleMedium),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(hintText: '输入角色名称'),
          ),
          const SizedBox(height: 16),
          Text('年龄:', style: Theme.of(context).textTheme.titleMedium),
          TextField(
            controller: _ageController,
            keyboardType: TextInputType.number,
            // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(hintText: '输入角色年龄'),
          ),
          const SizedBox(height: 16),
          Text('阵营:', style: Theme.of(context).textTheme.titleMedium),
          DropdownButton<String>(
            value: _selectedAlignment,
            hint: const Text('选择阵营'),
            isExpanded: true,
            onChanged: (String? newValue) {
              setState(() {
                _selectedAlignment = newValue;
                _onChanged();
              });
            },
            items:
                _alignmentOptions.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          Text('背景:', style: Theme.of(context).textTheme.titleMedium),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: _backgrounds.keys.map((background) {
              return ChoiceChip(
                label: Text(background),
                selected: _selectedBackground == background,
                onSelected: (selected) {
                  setState(() {
                    _selectedBackground = background;
                    _onChanged();
                    _loadBackgroundDescription(background);
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          if (_selectedBackground != null)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: MarkdownBody(
                data: _backgroundDescription,
              ),
            ),
        ],
      ),
    );
  }
}
