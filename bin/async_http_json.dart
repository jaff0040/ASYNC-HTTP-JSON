import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  await fetchRandomUsers();
}

Future<void> fetchRandomUsers() async {
  print('=== Fetching Data for 10 Random Users ===\n'); // Topic message

  const url =
      'https://random-data-api.com/api/users/random_user?size=10'; // Fetches 10 random users

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Decode JSON response
      final List<dynamic> users = json.decode(response.body);

      int counter = 1; // Initialize a counter for numbering

      // Loop through users and print numbered output with uid, first_name, and last_name
      for (var user in users) {
        print(
            '$counter. ${user['id']}: ${user['first_name']} ${user['last_name']}');
        counter++; // Increment the counter for each user
      }
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}
