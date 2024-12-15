import 'package:flutter/material.dart';
import '../widgets/joke_card.dart';
import '../service/api_service.dart';

class RandomJoke extends StatefulWidget {
  const RandomJoke({super.key});

  @override
  State<RandomJoke> createState() => _RandomJokeState();
}

class _RandomJokeState extends State<RandomJoke> {
  String setup = '';
  String punchline = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRandomJoke();
  }

  Future<void> fetchRandomJoke() async {
    try {
      final joke = await JokeService.getRandomJoke();
      setState(() {
        setup = joke.setup;
        punchline = joke.punchline;
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
        title: const Text('Random Joke of the Day'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
        child: JokeCard(
          setup: setup,
          punchline: punchline,
        ),
      ),
    );
  }
}
