class Joke {
  final id;
  final category;
  final String setup;
  final String punchline;

  Joke({required this.id, required this.category ,required this.setup, required this.punchline});
  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      id:json['id'],
      category: json['type'],
      setup: json['setup'],
      punchline: json['punchline'],
    );
  }
}

