import 'package:flutter/material.dart';
import 'package:laboratory2/screens/random_joke.dart';
import 'screens/jokes_list.dart';
import 'service/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes Demo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> jokeCategories = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchJokeCategories();
  }

  Future<void> fetchJokeCategories() async {
    try {
      final categories = await JokeService.getJokeCategories();
      setState(() {
        jokeCategories = categories;
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
        title: const Text('Joke Categories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shuffle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RandomJoke()),
              );
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: jokeCategories.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(jokeCategories[index]),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JokeListPage(jokeType: jokeCategories[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
