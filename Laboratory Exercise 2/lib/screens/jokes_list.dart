import 'package:flutter/material.dart';
import '../widgets/joke_card.dart';
import '../service/api_service.dart';
import '../models/joke.dart';

class JokeListPage extends StatefulWidget {
  final String jokeType;

  const JokeListPage({Key? key, required this.jokeType}) : super(key: key);

  @override
  _JokeListPageState createState() => _JokeListPageState();
}

class _JokeListPageState extends State<JokeListPage> {
  List<Joke> jokes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchJokes();
  }

  Future<void> fetchJokes() async {
    try {
      final fetchedJokes = await JokeService.getJokesByCategory(widget.jokeType);  // Изменето за да користи JokeService
      setState(() {
        jokes = fetchedJokes;
        isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.jokeType} Jokes'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          return JokeCard(
            setup: jokes[index].setup,
            punchline: jokes[index].punchline,
          );
        },
      ),
    );
  }
}
