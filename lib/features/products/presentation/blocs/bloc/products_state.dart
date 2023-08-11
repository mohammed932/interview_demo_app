part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductsIntialState extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  final List<Product> products;
  ProductsLoadedState({required this.products});
  @override
  List<Object> get props => [products];
}

class ProductsErrorState extends ProductsState {
  final String message;
  ProductsErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
