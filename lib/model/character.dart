class Character {
  final String name;
  final String description;
  final Thumbnail thumbnail;
  final List<ComicItem> comics;
  final List<CharacterUrl> urls;

  Character({
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.comics,
    required this.urls
  });

  String getThumbnailUrl() {
    return "${thumbnail.path}/standard_fantastic." "${thumbnail.extension}";
  }

  String getImageUrl() {
    return "${thumbnail.path}/detail." "${thumbnail.extension}";
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

class CharacterUrl {
  final String type;
  final String url;

  CharacterUrl({
    required this.type,
    required this.url
  });

  factory CharacterUrl.fromJson(Map<String, dynamic> data) {
    final type = data['type'] as String;
    final url = data['url'] as String;

    return CharacterUrl(type: type, url: url);
  }
}
