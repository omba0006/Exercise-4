import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  final url = Uri.parse('https://random-data-api.com/api/v2/users?size=10'); 

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> users = jsonDecode(response.body);
      for (var user in users) {
        print('${user['id']} - ${user['first_name']} ${user['last_name']}');
      }
    } else {
      print('Failed to load users. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}