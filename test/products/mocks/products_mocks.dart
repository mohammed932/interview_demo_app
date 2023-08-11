import 'package:interview_test/features/products/domain/entities/product.dart';
import 'package:interview_test/features/products/domain/entities/rating.dart';

List<Product> mockProducts = [
  const Product(
    id: 1,
    title: 'Product 1',
    price: 23.5,
    description: 'description 1',
    image: 'image 1',
    rating: Rating(
      count: 10,
      rate: 2,
    ),
  ),
  const Product(
    id: 2,
    title: 'Product 2',
    price: 28.0,
    description: 'description 2',
    image: 'image 2',
    rating: Rating(
      count: 11,
      rate: 4,
    ),
  )
];
