import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_api_flutter_app/model/character.dart';
import '../auth/secrets.dart';

class MarvelCharacterAPI {
  static Future<List<Character>> fetchCharacters() async {
    final ts = DateTime.now();
    final hash = md5
        .convert(
          utf8.encode('$ts$marvelPrivateKey$marvelPublicKey'),
        )
        .toString();
    final requestUrl = "$marvelApiStart$marvelPublicKey&ts=$ts&hash=$hash";
    final url = Uri.parse(requestUrl);
    final response = await http.get(url);
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    final results = jsonData['data']['results'] as List<dynamic>;
    if (response.statusCode == 200) {
      final marvelDataList = results.map<Character>((character) {
        final thumbnail = Thumbnail(
          path: character['thumbnail']['path'],
          extension: character['thumbnail']['extension'],
        );
        final comicsData = character['comics']['items'] as List<dynamic>;
        final comics = comicsData != null
            ? comicsData
                .map((comicsData) =>
                    ComicItem.fromJson(comicsData as Map<String, dynamic>))
                .toList()
            : <ComicItem>[];
        final urlsList = character['urls'] as List<dynamic>;
        final urls = urlsList != null
            ? urlsList
              .map((urlsList) =>
                  CharacterUrl.fromJson(urlsList as Map<String, dynamic>))
              .toList()
            : <CharacterUrl>[];
        return Character(
          name: character['name'],
          description: character['description'],
          thumbnail: thumbnail,
          comics: comics,
          urls: urls
        );
      }).toList();
      return marvelDataList;
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
