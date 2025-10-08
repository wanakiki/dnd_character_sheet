import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter_markdown/flutter_markdown.dart';

class RaceSelectionStep extends StatefulWidget {
  final Function(String) onRaceSelected;

  const RaceSelectionStep({super.key, required this.onRaceSelected});

  @override
  State<RaceSelectionStep> createState() => _RaceSelectionStepState();
}

class _RaceSelectionStepState extends State<RaceSelectionStep> {
  Map<String, String> _races = {}; // Map race name to its full asset path
  String? _selectedRace;
  String _raceDescription = '';

  @override
  void initState() {
    super.initState();
    _loadRaces();
  }

  Future<void> _loadRaces() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final Map<String, String> raceAssets = {};
    for (final key in manifestMap.keys) {
      if (key.startsWith('assets/render_md/race/') && key.endsWith('.md')) {
        String fileName = key.split('/').last;
        String raceName = fileName.substring(0, fileName.length - 3);
        if (raceName != '种族') {
          raceAssets[raceName] = key; // Map name to full path
        }
      }
    }

    setState(() {
      _races = raceAssets;
    });
  }

  Future<void> _loadRaceDescription(String raceName) async {
    final String? assetPath = _races[raceName];
    if (assetPath == null) {
      setState(() {
        _raceDescription = '无法找到资源路径。';
      });
      return;
    }

    try {
      final description = await rootBundle.loadString(assetPath);
      setState(() {
        _raceDescription = description;
      });
    } catch (e) {
      setState(() {
        _raceDescription = '无法加载种族描述。请检查文件是否存在或应用配置是否正确。';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('选择你的种族:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: _races.keys.map((race) {
              return ChoiceChip(
                label: Text(race),
                selected: _selectedRace == race,
                onSelected: (selected) {
                  setState(() {
                    _selectedRace = race;
                    widget.onRaceSelected(race);
                    _loadRaceDescription(race);
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          if (_selectedRace != null)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: MarkdownBody(
                data: _raceDescription,
              ),
            ),
        ],
      ),
    );
  }
}
