import 'package:flutter_test/flutter_test.dart';
import 'package:interview_test/core/errors/failure.dart';
import 'package:interview_test/core/usecase/base_usecase.dart';
import 'package:interview_test/features/products/domain/repositories/base_product_repository.dart';
import 'package:interview_test/features/products/domain/usecases/get_products_usecase.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../mocks/products_mocks.dart';

class MockProductRepository extends Mock
    implements BaseProductRepository {} // Create a mock class for BaseProductRepository

void main() {
  late GetProductsUsecase usecase;
  late MockProductRepository mockRepository;

  setUp(() {
    mockRepository = MockProductRepository();
    usecase = GetProductsUsecase(repository: mockRepository);
  });

  test('call returns a list of products', () async {
    when(mockRepository.getProducts()).thenAnswer((_) async => Right(mockProducts));

    final result = await usecase(const NoParams());

    expect(result, Right(mockProducts));
  });

  test('call handles repository failure', () async {
    final mockFailure = ServerFailure(message: 'Server error');
    when(mockRepository.getProducts()).thenAnswer((_) async => Left(mockFailure));

    final result = await usecase(const NoParams());

    expect(result, Left(mockFailure));
  });
}
