import 'package:flutter/material.dart';
import 'package:marvel_api_flutter_app/model/character.dart';
import 'package:marvel_api_flutter_app/view/character_page.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen(this.character, {super.key});

  @override
  Widget build(BuildContext context) {
    final name = character.name;
    final description = character.description;
    final imageUrl = character.getImageUrl();
    final comics = createComicsList(character.comics);
    return CharacterPage(
      name: name,
      description: description,
      image: imageUrl,
      comics: comics,
    );
  }

  List<String> createComicsList(List<ComicItem> comics) {
    List<String> comicsList = [];
    var shownComicsLength = 0;

    if (comics.length >= 5) {
      shownComicsLength = 5;
    } else {
      shownComicsLength = comics.length;
    }
    for (var i = 0; i < shownComicsLength; i++) {
      comicsList.add(comics[i].name);
    }
    return comicsList;
  }
}
