import 'package:interview_test/features/products/domain/entities/product.dart';

import 'rating_model.dart';

// ignore: must_be_immutable
class ProductModel extends Product {
  const ProductModel({
    required super.id,
    super.title,
    super.image,
    super.description,
    super.rating,
    required super.price,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      rating: json['rating'] != null ? RatingModel.fromJson(json['rating']) : null,
      price: json['price'] ?? 0,
    );
  }
}
