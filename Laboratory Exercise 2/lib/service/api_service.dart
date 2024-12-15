import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/joke.dart';

class JokeService {
  static const String _baseUrl = 'https://official-joke-api.appspot.com';
a
  static Future<List<String>> getJokeCategories() async {
    final response = await http.get(Uri.parse('$_baseUrl/types'));
    if (response.statusCode == 200) {
      return List<String>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load joke categories');
    }
  }

  static Future<List<Joke>> getJokesByCategory(String category) async {
    final response = await http.get(Uri.parse('$_baseUrl/jokes/$category/ten'));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((jokeJson) => Joke.fromJson(jokeJson))
          .toList();
    } else {
      throw Exception('Failed to load jokes');
    }
  }

  static Future<Joke> getRandomJoke() async {
    final response = await http.get(Uri.parse('$_baseUrl/random_joke'));
    if (response.statusCode == 200) {
      return Joke.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load random joke');
    }
  }
}


