import 'package:flutter/material.dart';
import 'package:marvel_api_flutter_app/view/character_card.dart';
import 'package:marvel_api_flutter_app/viewmodels/character_list_view_model.dart';
import 'package:provider/provider.dart';

class MarvelHomeScreen extends StatefulWidget {
  const MarvelHomeScreen({Key? key}) : super(key: key);

  @override
  State<MarvelHomeScreen> createState() => _MarvelHomeScreenState();
}

class _MarvelHomeScreenState extends State<MarvelHomeScreen> {
  var viewModel = CharacterListViewModel();

  @override
  Widget build(BuildContext context) {
    return _createScaffold();
  }

  @override
  void initState() {
    super.initState();
    viewModel.loadData();
  }

  ListView _createScrollingListView() {
    return ListView.builder(
      itemCount: viewModel.characters.length,
      itemBuilder: (context, index) {
        final character = viewModel.characters[index];
        final name = character.name;
        final description = character.description;
        final imageUrl = character.getThumbnailUrl();
        return CharacterCard(
          name: name,
          description: description,
          thumbnail: imageUrl,
          character: character,
        );
      },
    );
  }

  Scaffold _createScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marvel API App'),
        backgroundColor: Colors.black54,
      ),
      body: ChangeNotifierProvider<CharacterListViewModel>(
        create: (BuildContext context) => viewModel,
        child:
            Consumer<CharacterListViewModel>(builder: (context, viewModel, _) {
          return _createScrollingListView();
        }),
      ),
    );
  }
}

