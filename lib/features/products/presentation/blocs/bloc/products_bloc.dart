import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/usecase/base_usecase.dart';
import '../../../domain/entities/product.dart';

part 'products_event.dart';
part 'products_state.dart';

abstract class IProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  IProductsBloc(super.initialState);
}

class ProductsBloc extends IProductsBloc {
  final BaseUseCase productsUseCase;
  ProductsBloc({required this.productsUseCase}) : super(ProductsIntialState()) {
    on<LoadProductsEvent>((event, emit) async {
      emit(ProductsLoadingState());
      final result = await productsUseCase(const NoParams());
      result.fold((error) {
        emit(ProductsErrorState(message: error.message));
      }, (products) {
        emit(ProductsLoadedState(products: products));
      });
    });
  }
}
