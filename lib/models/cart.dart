import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'catalog.dart';

class CartModel extends ChangeNotifier {
  /// Internal, private state of the cart
  final List<Item> _items = [];

  /// An unmodifiable view of the items in the cart
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  /// The current total price of all items
  double get totalPrice =>
      _items.fold<double>(0, (prevValue, elem) => prevValue + elem.price);

  /// Adds item to the cart
  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }

  /// Removes particular item from the cart
  void remove(Item item) {
    _items.remove(item);
    notifyListeners();
  }

  /// Removes all items from the cart
  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
