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
          ? const Center(
        child: Text(
          "No favorites yet!",
          style: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.w500),
        ),
      )
          :ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        itemCount: favoriteBooks.length,
        itemBuilder: (context, index) {
          final book = favoriteBooks[index];

          return Card(
            elevation: 6,
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // Rounded corners
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E3C72), Color(0xFF2A5298)], // Beautiful gradient
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(12), // Rounded image
                  child: book['thumbnail'] != ''
                      ? Image.network(
                    book['thumbnail'],
                    width: 60,
                    height: 80,
                    fit: BoxFit.cover,
                  )
                      : Container(
                    width: 60,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.book, size: 40, color: Colors.white),
                  ),
                ),
                title: Text(
                  book['title'] ?? "No Title",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    book['authors'] ?? "Unknown Author",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red, size: 30),
                  onPressed: () async {
                    await dbHelper.removeFromFavorites(book['id']);
                    _loadFavorites();
                  },
                ),
              ),
            ),
          );
        },
      ),

    );
  }

}
