import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/character.dart';
import '../data/character_manager.dart';

class SwitchCharacterScreen extends StatefulWidget {
  @override
  _SwitchCharacterScreenState createState() => _SwitchCharacterScreenState();
}

class _SwitchCharacterScreenState extends State<SwitchCharacterScreen> {
  bool _isEditMode = false;
  int? _activeCharacterId;

  @override
  void initState() {
    super.initState();
    // Initialize the active character ID with the current character
    _activeCharacterId =
        Provider.of<CharacterManager>(context, listen: false).character.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('切换角色'),
        actions: [
          IconButton(
            icon: Icon(_isEditMode ? Icons.check : Icons.edit),
            onPressed: () {
              setState(() {
                _isEditMode = !_isEditMode;
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Character>>(
        future: Provider.of<CharacterManager>(context, listen: false)
            .fetchAllCharacters(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('加载角色时出错'));
          }
          final characters = snapshot.data!;
          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final character = characters[index];
              final isActive = character.id == _activeCharacterId;
              return Card(
                child: ListTile(
                  title: Text(character.name),
                  onTap: () {
                    setState(() {
                      _activeCharacterId = character.id;
                      Provider.of<CharacterManager>(context, listen: false)
                          .setCurrentCharacter(character);
                    });
                  },
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isActive) Icon(Icons.check, color: Colors.green),
                      if (_isEditMode)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                _showEditCharacterDialog(context, character);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () async {
                                await Provider.of<CharacterManager>(context,
                                        listen: false)
                                    .deleteCharacter(character.id);
                                setState(
                                    () {}); // Refresh the UI after deletion
                              },
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddCharacterDialog(context);
        },
        child: Icon(Icons.add),
        tooltip: '新增角色',
      ),
    );
  }

  void _showAddCharacterDialog(BuildContext context) {
    String characterName = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('新增角色'),
          content: TextField(
            decoration: InputDecoration(labelText: '角色名'),
            onChanged: (value) {
              characterName = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('取消'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (characterName.isNotEmpty) {
                  final newCharacter = Character.empty();
                  newCharacter.name = characterName;
                  await Provider.of<CharacterManager>(context, listen: false)
                      .addCharacter(newCharacter);
                  setState(() {}); // Refresh the UI after adding
                }
                Navigator.of(context).pop();
              },
              child: Text('确认'),
            ),
          ],
        );
      },
    );
  }

  void _showEditCharacterDialog(BuildContext context, Character character) {
    String characterName = character.name;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('修改角色名'),
          content: TextField(
            decoration: InputDecoration(labelText: '角色名'),
            controller: TextEditingController(text: characterName),
            onChanged: (value) {
              characterName = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('取消'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (characterName.isNotEmpty) {
                  Provider.of<CharacterManager>(context, listen: false)
                      .updateCharacter({'name': characterName});
                  setState(() {}); // Refresh the UI after updating
                }
                Navigator.of(context).pop();
              },
              child: Text('确认'),
            ),
          ],
        );
      },
    );
  }
}
