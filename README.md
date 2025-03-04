📚 Book Finder App
🚀 Overview
Book Finder App allows users to search for books using an API, save their favorite books, and toggle between light and dark modes.

✨ Features
🔍 Search for books using the Google Books API
❤️ Add/remove books from favorites (SQLite)
🌙 Toggle Light & Dark Mode (Saved using SharedPreferences)
⚡ State Management: Uses Provider / Riverpod / BLoC
🔄 Handles API failures & empty states gracefully
🛠️ Technologies Used
Flutter
Dart
Google Books API
SQLite
Provider / Riverpod / BLoC
SharedPreferences
📥 Installation
1️⃣ Clone the repository:

bash
Copy
Edit
git clone https://github.com/your-username/book-finder-app.git
cd book-finder-app
2️⃣ Install dependencies:

bash
Copy
Edit
flutter pub get
3️⃣ Run the app:

bash
Copy
Edit
flutter run
🔗 API Resources
Google Books API
Example endpoints:
https://www.googleapis.com/books/v1/volumes?q=harry+potter

📸 Screenshots
(Attach relevant screenshots of your app’s UI here)

📝 How It Works
Users search for books by entering a keyword.
Books are fetched from the Google Books API.
Users can add books to favorites (stored in SQLite).
Dark Mode preference is stored using SharedPreferences.
🐞 Error Handling
Displays loading indicators while fetching data.
Shows error messages when API calls fail.
Displays a "No results found" message if no books match the search.
🤝 Contributing
Contributions are welcome! Feel free to open a pull request.


