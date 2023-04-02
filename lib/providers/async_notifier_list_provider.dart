import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'async_notifier_list_provider.freezed.dart';
part 'async_notifier_list_provider.g.dart';


@freezed
class Product with _$Product{
  const Product._();
  const factory Product({
    String? name,
    String? description,

  }) = _Product;

}

  const Product _product1 =  Product(name: "Dart course for beginners",
                            description: "This is course will make you a dart star");
  final Product _product2 = _product1.copyWith(description: "This course will make you a pro");
  final Product _product3 = _product1.copyWith(name: "Ultimate Dart course for beginners");


final products = [
              _product1,
              _product2,
              _product3,
];

@riverpod
class AsyncProducts extends _$AsyncProducts {
  Future<List<Product>> _fetchProducts() async {
    await Future.delayed(const Duration(seconds: 3));
    return products;
  }


  @override
  FutureOr<List<Product>> build() async {
    return _fetchProducts();
  }

  Future<void>clearProducts()async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async{
      await Future.delayed(const Duration(seconds: 3));
      return [];
    });
  }

}


