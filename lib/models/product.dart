class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rating;
  final int ratingCount;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    this.rating = 0.0,
    this.ratingCount = 0,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    double parsedRating = 0.0;
    int parsedCount = 0;

    if (json['rating'] is Map) {
      final ratingMap = json['rating'] as Map<String, dynamic>;
      parsedRating = (num.tryParse('${ratingMap['rate']}') ?? 0.0).toDouble();
      parsedCount = int.tryParse('${ratingMap['count']}') ?? 0;
    }

    return Product(
      id: json['id'] is int ? json['id'] : int.tryParse('${json['id']}') ?? 0,
      title: json['title']?.toString() ?? json['name']?.toString() ?? '',
      price: (num.tryParse('${json['price']}') ?? 0.0).toDouble(),
      description: json['description']?.toString() ?? '',
      category: json['category']?.toString() ?? '',
      image: json['image']?.toString() ?? json['thumbnail']?.toString() ?? '',
      rating: parsedRating,
      ratingCount: parsedCount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': {'rate': rating, 'count': ratingCount},
    };
  }
}
