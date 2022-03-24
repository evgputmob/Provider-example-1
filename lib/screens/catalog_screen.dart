import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper/models/cart.dart';
import 'package:provider_shopper/models/catalog.dart';
import '../widgets/catalog_list_item.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => CatalogListItem(index),
                childCount: catalogItems.length),
          ),
        ],
      ),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();
    final cartItemsCount = cart.items.length;

    return SliverAppBar(
      title: const Text('Catalog'),
      floating: true,
      actions: [
        Visibility(
          visible: (cartItemsCount > 0),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/cart'),
            child: Row(
              children: [
                const Icon(Icons.shopping_cart),
                const SizedBox(width: 5),
                Text(cartItemsCount.toString()),
                const SizedBox(width: 30),
              ],
            ),
          ),
        ), //
      ],
    );
  }
}
