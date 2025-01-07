import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final VoidCallback onFavorite;

  const JokeCard(
      {super.key, required this.title, required this.onTap, required this.onFavorite});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(title),
        trailing: IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: onFavorite,
        ),
        onTap: onTap,
      ),
    );
  }
}