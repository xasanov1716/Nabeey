class CategoryModel {
  final int id;
  final String name;
  final String description;
  final String image;
  final List books;
  final List audios;
  final List videos;
  final List articles;

  CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.books,
    required this.audios,
    required this.videos,
    required this.articles,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      image: json['image'] as String? ?? '',
      books: json['books'] as List? ?? [],
      audios: json['audios'] as List? ?? [],
      videos: json['videos'] as List? ?? [],
      articles: json['articles'] as List? ?? [],
    );
  }
}
