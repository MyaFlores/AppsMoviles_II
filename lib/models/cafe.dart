class Cafe {
  final String title;
  final String description;
  final List<String> ingredients;
  final String image;
  final int id;

  Cafe({
    required this.title,
    required this.description,
    required this.ingredients,
    required this.image,
    required this.id,
  });

  factory Cafe.fromJson(Map<String, dynamic> json) {
    return Cafe(
      title: json['title'] ?? 'Sin título',
      description: json['description'] ?? 'Sin descripción',
      // Convertimos la lista dinámica a una lista de Strings
      ingredients: json['ingredients'] != null 
          ? List<String>.from(json['ingredients']) 
          : [],
      image: json['image'] ?? '',
      id: json['id'] ?? 0,
    );
  }
}