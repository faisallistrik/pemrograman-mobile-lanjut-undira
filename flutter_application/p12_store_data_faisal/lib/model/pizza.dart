class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  String get assetPath => imageUrl.startsWith('assets/') ? imageUrl : 'assets/$imageUrl';

  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      pizzaName: json['pizzaName']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      price: (json['price'] is num)
          ? (json['price'] as num).toDouble()
          : double.tryParse(json['price'].toString()) ?? 0.0,
      imageUrl: json['imageUrl']?.toString() ?? '',
    );
  }
}
