part of 'products_widgets.imports.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  const ProductTile({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title ?? ''),
      subtitle: Text('\$${product.price}'),
      onTap: onTap,
      leading: Image.network(
        product.image ?? AppImages.failbackImage200,
        fit: BoxFit.fill,
        width: 50,
        height: 50,
      ),
    );
  }
}
