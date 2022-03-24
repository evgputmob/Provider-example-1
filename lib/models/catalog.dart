const List<Item> catalogItems = [
  Item(id: 1, name: 'Cucumber', price: 2.5),
  Item(id: 2, name: 'Tomatoes', price: 2.7),
  Item(id: 3, name: 'Orange juice', price: 1.5),
  Item(id: 4, name: 'Donuts', price: 0.5),
  Item(id: 5, name: 'Chocolate', price: 3.5),
  Item(id: 6, name: 'Potatoes', price: 1.0),
  Item(id: 7, name: 'Cabbage', price: 1.2),
  Item(id: 8, name: 'Apples', price: 1.5),
  Item(id: 9, name: 'Strawberry', price: 3.0),
  Item(id: 10, name: 'Raspberry', price: 3.1),
  Item(id: 11, name: 'Blueberry', price: 3.2),
];

//------------------
class Item {
  final int id;
  final String name;
  final double price;

  const Item({
    required this.id,
    required this.name,
    required this.price,
  });
}
