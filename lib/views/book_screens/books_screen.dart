import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'book_view_model_logics/book_view_logic.dart';
import 'books_provider/search_provider.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BooksViewModel(Provider.of<BookProvider>(context, listen: false)),
      child: Consumer<BooksViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(title: const Text("Search Books",)),
            body: viewModel.isLoading
                ? const Center(
              child: SpinKitWaveSpinner(color: Colors.blue, size: 50),
            )
                : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    onChanged: viewModel.runFilter,
                    decoration: const InputDecoration(
                      labelText: "Search",
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),

                  const SizedBox(height: 20),
                  Expanded(
                    child: viewModel.foundBooks.isEmpty
                        ? const Center(
                      child: Text(
                        "No results found",
                        style: TextStyle(
                            fontSize: 18, color: Colors.white),
                      ),
                    )
                    :ListView.builder(
                      itemCount: viewModel.foundBooks.length,
                      itemBuilder: (context, index) {
                        final book = viewModel.foundBooks[index];
                        final bookInfo = book.volumeInfo;
                        final isFavorite = viewModel.favoriteStatus[book.id!] ?? false;

                        return Card(
                          key: ValueKey(book.id),
                          elevation: 6,
                          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16), // Rounded edges
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
                                borderRadius: BorderRadius.circular(12), // Rounded image corners
                                child: bookInfo?.imageLinks?.thumbnail != null
                                    ? Image.network(
                                  bookInfo!.imageLinks!.thumbnail!,
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
                                bookInfo?.title ?? "No Title",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  bookInfo?.authors?.join(', ') ?? "Unknown Author",
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  isFavorite ? Icons.favorite : Icons.favorite_border,
                                  color: isFavorite ? Colors.red : Colors.white70,
                                  size: 28,
                                ),
                                onPressed: () => viewModel.toggleFavorite(book),
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
