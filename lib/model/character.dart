class Character {
  final String name;
  final String description;
  final Thumbnail thumbnail;

  Character({
    required this.name,
    required this.description,
    required this.thumbnail
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
