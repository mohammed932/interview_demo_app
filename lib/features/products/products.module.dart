import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:interview_test/core/network/dio_helper.dart';
import 'package:interview_test/core/network/network_interface.dart';
import 'package:interview_test/core/usecase/base_usecase.dart';
import 'package:interview_test/features/products/data/datasources/base_products_datasource.dart';
import 'package:interview_test/features/products/data/datasources/products_datasource.dart';
import 'package:interview_test/features/products/data/repositories/products_repository.dart';
import 'package:interview_test/features/products/domain/entities/product.dart';
import 'package:interview_test/features/products/domain/repositories/base_product_repository.dart';
import 'package:interview_test/features/products/domain/usecases/get_products_usecase.dart';
import 'package:interview_test/features/products/presentation/blocs/bloc/products_bloc.dart';

@module
abstract class ProductsDiModule {
  @lazySingleton
  BaseNetwork get baseNetwork => DioHelper(dio: Dio());

  // DataSourse
  @lazySingleton
  BaseProductsDataSource get productsDataSource =>
      ProductsDataSource(network: baseNetwork);

  // Repository
  @lazySingleton
  BaseProductRepository get baseProductRepository =>
      ProductsRepository(productsDataSource: productsDataSource);
  // UseCase
  @lazySingleton
  BaseUseCase<List<Product>, NoParams> get getProductsUsecase =>
      GetProductsUsecase(repository: baseProductRepository);
  // Bloc
  @injectable
  IProductsBloc get productsBloc =>
      ProductsBloc(productsUseCase: getProductsUsecase);
}
