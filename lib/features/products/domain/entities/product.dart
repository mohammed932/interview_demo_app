import 'package:equatable/equatable.dart';
import 'package:interview_test/features/products/domain/entities/rating.dart';

// ignore: must_be_immutable
class Product extends Equatable {
  final int id;
  final String? title;
  final String? image;
  final String? description;
  final Rating? rating;
  final num price;

  const Product({
    required this.id,
    this.title,
    this.image,
    this.rating,
    this.description,
    required this.price,
  });

  @override
  List<Object?> get props => [id, title, image, price, description, rating];
}
