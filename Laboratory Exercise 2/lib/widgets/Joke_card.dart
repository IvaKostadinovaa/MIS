import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  final String setup;
  final String punchline;

  const JokeCard({Key? key, required this.setup, required this.punchline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(setup),
        subtitle: Text(punchline),
      ),
    );
  }
}
