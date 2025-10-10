class CatItem {
  final String id;
  final String name;
  final String origin;
  final String temperament;
  final String description;
  final String imageUrl;

  CatItem({
    required this.id,
    required this.name,
    required this.origin,
    required this.temperament,
    required this.description,
    required this.imageUrl,
  });

  factory CatItem.fromJson(Map<String, dynamic> json) {
    final breeds = json['breeds'] as List?;
    final breed = (breeds != null && breeds.isNotEmpty) ? breeds.first : null;

    return CatItem(
      id: json['id'] ?? '',
      name: breed?['name'] ?? 'Desconocido',
      origin: breed?['origin'] ?? 'N/A',
      temperament: breed?['temperament'] ?? '',
      description: breed?['description'] ?? '',
      imageUrl: json['url'] ?? '',
    );
  }
}


