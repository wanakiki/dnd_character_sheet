import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter_markdown/flutter_markdown.dart';

class ClassSelectionStep extends StatefulWidget {
  final Function(String) onClassSelected;

  const ClassSelectionStep({super.key, required this.onClassSelected});

  @override
  State<ClassSelectionStep> createState() => _ClassSelectionStepState();
}

class _ClassSelectionStepState extends State<ClassSelectionStep> {
  Map<String, List<String>> _classHierarchy = {};
  Map<String, String> _fullClassNameToPath = {};
  String? _selectedBaseClass;
  String? _selectedSubClass;
  String _classDescription = '';

  @override
  void initState() {
    super.initState();
    _loadClasses();
  }

  Future<void> _loadClasses() async {
    print("Starting _loadClasses...");
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    // print("AssetManifest.json content: $manifestContent");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final Map<String, List<String>> classHierarchy = {};
    final Map<String, String> fullClassNameToPath = {};

    for (final key in manifestMap.keys) {
      if (key.startsWith('assets/render_md/class/') && key.endsWith('.md')) {
        print("Processing asset key: $key");
        String fileName = key.split('/').last;
        String fullClassName = fileName.substring(0, fileName.length - 3);
        fullClassNameToPath[fullClassName] = key;
        print("Found class: $fullClassName at path: $key");

        List<String> parts = fullClassName.split('-');
        if (parts.length == 2) {
          String baseClass = parts[0];
          String subClass = parts[1];
          print("  - Base class: $baseClass, Subclass: $subClass");
          if (!classHierarchy.containsKey(baseClass)) {
            classHierarchy[baseClass] = [];
          }
          classHierarchy[baseClass]!.add(subClass);
        } else {
          print("  - No subclass found for: $fullClassName");
          if (!classHierarchy.containsKey(fullClassName)) {
            classHierarchy[fullClassName] = [];
          }
        }
      }
    }

    print("Final class hierarchy: $classHierarchy");
    print("Final class name to path map: $fullClassNameToPath");

    setState(() {
      print("Calling setState with new class data.");
      _classHierarchy = classHierarchy;
      _fullClassNameToPath = fullClassNameToPath;
    });
  }

  Future<void> _loadClassDescription(String baseClass, String subClass) async {
    final String fullClassName = '$baseClass-$subClass';
    final String? assetPath = _fullClassNameToPath[fullClassName];

    if (assetPath == null) {
      setState(() {
        _classDescription = '无法找到资源路径。';
      });
      return;
    }

    try {
      final description = await rootBundle.loadString(assetPath);
      setState(() {
        _classDescription = description;
      });
    } catch (e) {
      setState(() {
        _classDescription = '无法加载职业描述。请检查文件是否存在或应用配置是否正确。';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('选择你的职业:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: _classHierarchy.keys.map((baseClass) {
              return ChoiceChip(
                label: Text(baseClass),
                selected: _selectedBaseClass == baseClass,
                onSelected: (selected) {
                  setState(() {
                    _selectedBaseClass = baseClass;
                    _selectedSubClass = null; // Reset subclass selection
                    _classDescription = ''; // Clear description
                  });
                },
              );
            }).toList(),
          ),
          if (_selectedBaseClass != null && _classHierarchy[_selectedBaseClass]!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('选择$_selectedBaseClass专精:',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: _classHierarchy[_selectedBaseClass]!.map((subClass) {
                      return ChoiceChip(
                        label: Text(subClass),
                        selected: _selectedSubClass == subClass,
                        onSelected: (selected) {
                          setState(() {
                            _selectedSubClass = subClass;
                            widget.onClassSelected('$_selectedBaseClass-$subClass');
                            _loadClassDescription(_selectedBaseClass!, subClass);
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 20),
          if (_classDescription.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: MarkdownBody(
                data: _classDescription,
              ),
            ),
        ],
      ),
    );
  }
}