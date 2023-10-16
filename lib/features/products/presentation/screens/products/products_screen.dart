part of 'products.imports.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<IProductsBloc>()..add(LoadProductsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
        ),
        body: BlocBuilder<IProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoadedState) {
              return ListView.separated(
                itemCount: state.products.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    thickness: 1,
                    indent: 70.0,
                    endIndent: 20.0,
                  );
                },
                itemBuilder: ((BuildContext context, int index) {
                  Product product = state.products[index];
                  return ProductTile(
                    product: product,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(
                            product: product,
                          ),
                        ),
                      );
                    },
                  );
                }),
              );
            } else if (state is ProductsErrorState) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
