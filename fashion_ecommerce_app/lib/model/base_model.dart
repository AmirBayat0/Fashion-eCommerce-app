  
class BaseModel {
  final int id;
  final String imageUrl;
  final String name;
  final double price;
  final double review;
  final double star;
    int value;

  BaseModel( {
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.review,
    required this.star,
    required this.value
  });
}
