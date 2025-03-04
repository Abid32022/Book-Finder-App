import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../services/database_helper.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> favoriteBooks = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() async {
    List<Map<String, dynamic>> books = await dbHelper.getFavorites();
    setState(() {
      favoriteBooks = books;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorite Books")),
      body: favoriteBooks.isEmpty
          ? const Center(child: Text("No favorites yet!", style: TextStyle(fontSize: 18, color: Colors.white)))
          : ListView.builder(
        itemCount: favoriteBooks.length,
        itemBuilder: (context, index) {
          final book = favoriteBooks[index];
          return Card(
            color: Colors.blue,
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: book['thumbnail'] != ''
                  ? Image.network(book['thumbnail'], width: 50, height: 50, fit: BoxFit.cover)
                  : const Icon(Icons.book, size: 50, color: Colors.white),
              title: Text(book['title'], style: const TextStyle(color: Colors.white, fontSize: 20)),
              subtitle: Text(book['authors'], style: const TextStyle(color: Colors.white, fontSize: 16)),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () async {
                  await dbHelper.removeFromFavorites(book['id']);
                  _loadFavorites();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
