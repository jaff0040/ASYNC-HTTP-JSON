import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  await fetchRandomUsers();
}

Future<void> fetchRandomUsers() async {
  print('=== Fetching Data for 10 Random Users ===\n');

  // Fetches 10 random users
  const url = 'https://random-data-api.com/api/users/random_user?size=10';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> users = json.decode(response.body);

      int counter = 1;

      for (var user in users) {
        print(
            "User $counter's uid: ${user['uid']}, first name: ${user['first_name']}, last name: ${user['last_name']}");
        counter++;
      }
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}
