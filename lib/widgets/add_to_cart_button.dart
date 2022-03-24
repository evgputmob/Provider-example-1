import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper/models/cart.dart';
import 'package:provider_shopper/models/catalog.dart';

class AddToCartButton extends StatelessWidget {
  final Item item;

  const AddToCartButton({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();
    final isInCart = cart.items.contains(item);

    return TextButton(
      onPressed: isInCart ? null : () => cart.add(item),
      child: isInCart
          ? const Icon(Icons.check, semanticLabel: 'ADDED')
          : const Text('ADD'),
    );
  }
}
