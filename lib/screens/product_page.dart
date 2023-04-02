
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/async_notifier_list_provider.dart';

class ProductPage extends ConsumerWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productProvider = ref.watch(asyncProductsProvider);
    return Scaffold(
        appBar: AppBar(
            title: const Text("AsyncNotifier"),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
                onPressed: () {
                  ref.read(asyncProductsProvider.notifier).clearProducts();
                },
              )
            ]
        ),

      body: Container(
        child: productProvider.when(
          data: (products)=> ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                  child: Card(
                    color: Colors.blueAccent,
                    elevation: 3,
                    child: ListTile(
                      title: Text("${products[index].name}",style: const TextStyle(
                          color: Colors.white,  fontSize: 15)),
                      subtitle: Text("${products[index].description}",style: const TextStyle(
                          color: Colors.white,  fontSize: 15)),
                    ),
                  ),
                );
              }),
          error: (err, stack) => Text("Error: $err",style: const TextStyle(
              color: Colors.white,  fontSize: 15)),
          loading: ()=> const Center(child: CircularProgressIndicator(color: Colors.blue,)),
        ),
      ),
    );
  }
}