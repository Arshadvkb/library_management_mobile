import 'dart:convert';
import 'package:http/http.dart' as http;


class HomeController {
		List<String> titles = [];
		List<String> authors = [];
		List<String> publishedDates = [];
		List<int> isbns = [];

		Future<void> fetchData(String url) async {
			try {
				// Use http scheme and allow custom url
				url = "http://localhost:8000/";
				final response = await http.get(Uri.parse("${url}api/book/view-books"));
				if (response.statusCode == 200) {
					final data = jsonDecode(response.body);
					// Support both list and object with 'books' key
					final books = (data is List)
						? data
						: (data['books'] ?? []);
					titles.clear();
					authors.clear();
					publishedDates.clear();
					isbns.clear();
					for (var book in books) {
						titles.add(book['title'] ?? '');
						authors.add(book['author'] ?? '');
						publishedDates.add(book['publishedDate']?.toString() ?? '');
						isbns.add(book['ISBN'] ?? '');
					}
				} else {
					throw Exception('Failed to load data: ${response.statusCode}');
				}
			} catch (e) {
				throw Exception('Error fetching data: $e');
			}
		}
}
