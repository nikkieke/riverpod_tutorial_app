import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../providers/list_provider.dart';

class ProductListPage extends ConsumerWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final productsProvider = ref.watch(futureProductsProvider);


    return Scaffold(
        appBar: AppBar(
          title: const Text("Future Provider Example"),
          actions: [
            DropdownButton<ProductSortType>(
              dropdownColor: Colors.brown,
              value: ref.watch(productSortTypeProvider),
                items: const [
                  DropdownMenuItem(
                    value: ProductSortType.name,
                    child: Icon(Icons.sort_by_alpha),
                ),
                  DropdownMenuItem(
                    value: ProductSortType.price,
                    child: Icon(Icons.sort),
                  ),
                ],
                onChanged: (value)=> ref.watch(productSortTypeProvider.notifier).state = value!
            ),
          ],
        ),
      backgroundColor: Colors.lightBlue,
      body: Container(
        child: productsProvider.when(
            data: (products)=> ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                    child: Card(
                      color: Colors.blueAccent,
                      elevation: 3,
                      child: ListTile(
                        title: Text(products[index].name,style: const TextStyle(
                            color: Colors.white,  fontSize: 15)),
                        subtitle: Text("${products[index].price}",style: const TextStyle(
                            color: Colors.white,  fontSize: 15)),
                      ),
                    ),
                  );
                }),
            error: (err, stack) => Text("Error: $err",style: const TextStyle(
                color: Colors.white,  fontSize: 15)),
            loading: ()=> const Center(child: CircularProgressIndicator(color: Colors.white,)),
        ),
      )
    );
  }
}

