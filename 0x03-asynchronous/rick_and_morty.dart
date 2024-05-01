import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> printRmCharacters() async {
  try {
    var response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));

    if (response.statusCode == 200) {
      // Decode the JSON response body
      var data = jsonDecode(response.body);

      // Extract characters from the data
      List<dynamic> characters = data['results'];

      // Print character names
      characters.forEach((character) {
        print(character['name']);
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    print('Failed to load data: $e');
  }
}

void main() async {
  await printRmCharacters();
}