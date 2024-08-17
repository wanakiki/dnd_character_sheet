import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final directory = await getApplicationDocumentsDirectory();
  // Hive.defaultDirectory = directory.path;

  runApp(BeeApp());
}

class BeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bee Favorites',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: FavoriteFlowers(),
    );
  }
}

class FavoriteFlowers extends StatefulWidget {
  @override
  _FavoriteFlowersState createState() => _FavoriteFlowersState();
}

class _FavoriteFlowersState extends State<FavoriteFlowers> {
  final Box<String> favoriteBox = Hive.box<String>(name: 'favorites');

  final List<String> flowers = ['Rose', 'Tulip', 'Daisy', 'Lily', 'Sunflower'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bee Favorites 🐝')),
      body: ListView.builder(
        itemCount: flowers.length,
        itemBuilder: (context, index) {
          final flower = flowers[index];
          return ListTile(
            title: Text(flower),
            trailing: IconButton(
              icon: Icon(Icons.star),
              onPressed: () {
                favoriteBox.add(flower);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$flower added to favorites! 🌼')),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.view_list),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => FavoritesDialog(favorites: favoriteBox.keys),
          );
        },
      ),
    );
  }
}

class FavoritesDialog extends StatelessWidget {
  final List<String> favorites;

  FavoritesDialog({required this.favorites});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Bee Favorites 🌼'),
      content: Container(
        width: 300,
        height: 200,
        child: ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(favorites[index]));
          },
        ),
      ),
      actions: [
        TextButton(
          child: Text('Close'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
