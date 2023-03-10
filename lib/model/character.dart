class Character {
  final String name;
  final String description;
  final Thumbnail thumbnail;
  final List<ComicItem> comics;

  Character({
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.comics
  });

  String getThumbnailUrl() {
    return "${thumbnail.path}/standard_fantastic." "${thumbnail.extension}";
  }
}

class Thumbnail {
  final String path;
  final String extension;

  Thumbnail({
    required this.path,
    required this.extension,
  });
}

class Comics {
  final List<ComicItem> comicItems;

  Comics({
    required this.comicItems,
  });
}

class ComicItem {
  final String resourceURI;
  final String name;

  ComicItem({
    required this.resourceURI,
    required this.name,
  });

  factory ComicItem.fromJson(Map<String, dynamic> data) {
    final resourceURI = data['resourceURI'] as String;
    final name = data['name'] as String;

    return ComicItem(resourceURI: resourceURI, name: name);
  }
}
