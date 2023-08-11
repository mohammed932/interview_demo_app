import 'package:flutter_test/flutter_test.dart';
import 'package:interview_test/core/errors/exception.dart';
import 'package:interview_test/core/errors/failure.dart';
import 'package:interview_test/features/products/data/datasources/base_products_datasource.dart';
import 'package:interview_test/features/products/data/repositories/products_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../mocks/products_mocks.dart';

class MockProductsDataSource extends Mock
    implements BaseProductsDataSource {} // Create a mock class for BaseProductsDataSource

void main() {
  late ProductsRepository repository;
  late MockProductsDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockProductsDataSource();
    repository = ProductsRepository(productsDataSource: mockDataSource);
  });

  test('getProducts returns a list of products', () async {
    when(mockDataSource.getProducts()).thenAnswer((_) async {
      return mockProducts;
    });

    final result = await repository.getProducts();

    expect(result, Right(mockProducts));
  });

  test('getProducts handles server exception', () async {
    when(mockDataSource.getProducts()).thenThrow(
      const SereverException(
        message: 'Server error',
        endPointUrl: '',
        error: '',
        statusCode: 404,
      ),
    );

    final result = await repository.getProducts();

    expect(result, const Left(ServerFailure(message: 'Server error')));
  });
}
