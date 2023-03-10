import 'package:flutter/widgets.dart';
import 'package:marvel_api_flutter_app/services/marvel_character_api.dart';

import '../model/character.dart';

class CharacterListViewModel extends ChangeNotifier {
  List<Character> characters = [];

  CharacterListViewModel();

  Future<void> loadData() async {
    characters = await MarvelCharacterAPI.fetchCharacters();
    notifyListeners();
  }
}
