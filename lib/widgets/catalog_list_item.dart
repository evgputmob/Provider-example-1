import 'package:flutter/material.dart';
import 'package:provider_shopper/widgets/add_to_cart_button.dart';
import '../models/catalog.dart';

class CatalogListItem extends StatelessWidget {
  final int index;

  const CatalogListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = catalogItems[index];

    return Card(
      child: ListTile(
        title: Text(item.name),
        subtitle: Text(item.price.toStringAsFixed(2)),
        trailing: AddToCartButton(item: item),
      ),
    );
  }
}
