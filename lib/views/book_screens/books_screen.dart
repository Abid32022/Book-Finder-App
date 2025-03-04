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
            appBar: AppBar(title: const Text("Search Books")),
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
                        : ListView.builder(
                      itemCount: viewModel.foundBooks.length,
                      itemBuilder: (context, index) {
                        final book = viewModel.foundBooks[index];
                        final bookInfo = book.volumeInfo;
                        final isFavorite =
                            viewModel.favoriteStatus[book.id!] ??
                                false;

                        return Card(
                          key: ValueKey(book.id),
                          color: Colors.blue,
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10),
                          child: ListTile(
                            leading: bookInfo
                                ?.imageLinks?.thumbnail !=
                                null
                                ? Image.network(
                              bookInfo!.imageLinks!
                                  .thumbnail!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )
                                : const Icon(Icons.book,
                                size: 50, color: Colors.white),
                            title: Text(
                              bookInfo?.title ?? "No Title",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            subtitle: Text(
                              bookInfo?.authors?.join(', ') ??
                                  "Unknown Author",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                              ),
                              onPressed: () =>
                                  viewModel.toggleFavorite(book),
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
