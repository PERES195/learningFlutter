import 'package:flutter/material.dart';
import 'package:marvel_api_flutter_app/services/marvel_character_api.dart';
import 'package:marvel_api_flutter_app/view/character_card.dart';
import '../model/character.dart';

class MarvelHomeScreen extends StatefulWidget {
  const MarvelHomeScreen({Key? key}) : super(key: key);

  @override
  State<MarvelHomeScreen> createState() => _MarvelHomeScreenState();
}

class _MarvelHomeScreenState extends State<MarvelHomeScreen> {
  List<Character> characters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marvel API App'),
        backgroundColor: Colors.black54,
      ),
      body: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          final character = characters[index];
          final name = character.name;
          final description = character.description;
          final imageUrl = character.getThumbnailUrl();
          return CharacterCard(
              name: name, description: description, thumbnail: imageUrl);
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchCharactersList();
  }

  Future<void> fetchCharactersList() async {
    final response = await MarvelCharacterAPI.fetchCharacters();
    setState(() {
      characters = response;
    });
  }
}
