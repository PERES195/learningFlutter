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
    final comicUrl = getComicUrl(character.urls);
    return CharacterPage(
      name: name,
      description: description,
      image: imageUrl,
      comics: comics,
      url: comicUrl
    );
  }

  List<String> createComicsList(List<ComicItem> comics) {
    List<String> comicsList = [];
    var shownComicsLength = 0;

    if (comics.length >= 20) {
      shownComicsLength = 20;
    } else {
      shownComicsLength = comics.length;
    }
    for (var i = 0; i < shownComicsLength; i++) {
      comicsList.add(comics[i].name);
    }
    return comicsList;
  }

  CharacterUrl? getComicUrl(List<CharacterUrl> urls) {
    Map<String, List<CharacterUrl>> urlMap = {};

    for (CharacterUrl url in urls) {
      urlMap.putIfAbsent(url.type, () => []).add(url);
    }
    print(urlMap['comiclink']);
    return urlMap['comiclink']?.first;

  }
}
