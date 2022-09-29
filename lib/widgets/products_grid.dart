// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shoppapp/providers/products.dart';
import 'package:shoppapp/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    required this.showFavs,
  });
  final bool showFavs;

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // builder: (c) => products[i],
        value: products[i],
        child: ProductItem(
            /* id: products[i].id,
          title: products[i].title, // removed when product[i] above is put and all constructors in product item removed
          imageUrl: products[i].imageUrl, */
            ),
      ),
    );
  }
}
