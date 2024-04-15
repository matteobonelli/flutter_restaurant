class Product {
  String id;
  final String name;
  final double price;
  final String? image;
  final String description;
  final Category category;

  Product({required this.id,
    required this.name,
    required this.price,
    this.image,
    required this.description,
    required this.category});

  String? get priceString => price.toStringAsFixed(2);

}

enum Category { pasta, pizza, dolce, carne, antipasto, secondo, pesce }
