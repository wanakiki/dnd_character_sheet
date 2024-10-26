// lib/main.dart
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../data/spell.dart';
import 'package:provider/provider.dart';
import 'spell_detail_page.dart';

class SpellListScreen extends StatefulWidget {
  @override
  _SpellListScreenState createState() => _SpellListScreenState();
}

class _SpellListScreenState extends State<SpellListScreen> {
  List<Spell> spells = [];
  List<Spell> filteredSpells = [];
  String searchQuery = '';
  String selectedClass = 'All';

  @override
  void initState() {
    super.initState();
    loadSpells();
  }

  Future<void> loadSpells() async {
    final isar = Provider.of<Isar>(context, listen: false);

    // Fetch spells from the database
    final importedSpells = await isar.spells.where().findAll();

    setState(() {
      spells = List.from(importedSpells);
      filteredSpells = spells;
    });
  }

  void filterSpells() {
    setState(() {
      filteredSpells = spells.where((spell) {
        final matchesName =
            spell.name.toLowerCase().contains(searchQuery.toLowerCase());
        final matchesClass =
            selectedClass == 'All' || spell.classes.contains(selectedClass);
        return matchesName && matchesClass;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('法术列表'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: '搜索法术',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                searchQuery = value;
                filterSpells();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedClass,
              onChanged: (value) {
                if (value != null) {
                  selectedClass = value;
                  filterSpells();
                }
              },
              items: <String>[
                'All',
                '法师',
                '术士',
                '牧师',
                '德鲁伊',
                '游侠',
                '圣骑士',
                '武僧',
                '野蛮人',
                '吟游诗人',
                '游荡者',
                '圣武士',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: filteredSpells.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: filteredSpells.length,
                    itemBuilder: (context, index) {
                      final spell = filteredSpells[index];
                      return ListTile(
                        title: Text(spell.name),
                        subtitle: Text(
                            'Level: ${spell.level}, School: ${spell.school}'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SpellDetailScreen(spell: spell),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
