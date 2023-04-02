import 'package:flutter_riverpod/flutter_riverpod.dart';

class Product{
  Product({required this.name, required this.price});

  final String name;
  final double price;
}
final _products = [
  Product(name: "Spagetti", price: 10),
  Product(name: "Indomie", price: 6),
  Product(name: "Fried Yam", price: 9),
  Product(name: "Beans", price: 10),
  Product(name: "Red Chicken feet", price: 2),
];

//This is going to be used to filter the products list by name or price
enum ProductSortType{
  name,
  price,
}
//This is the default sort type
final productSortTypeProvider = StateProvider<ProductSortType>((ref) => ProductSortType.name);


final futureProductsProvider = FutureProvider<List<Product>>((ref) async {
  await Future.delayed(const Duration(seconds: 3));
  final sortType = ref.watch(productSortTypeProvider);
switch (sortType) {
    case ProductSortType.name:
       _products.sort((a, b) => a.name.compareTo(b.name));
       break;
    case ProductSortType.price:
       _products.sort((a, b) => a.price.compareTo(b.price));
}
  return _products;
});






