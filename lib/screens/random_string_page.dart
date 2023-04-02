import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/notifier_list_provider.dart';


class RandomStringPage extends ConsumerWidget {
  const RandomStringPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {

    List<String> randomNumList = ref.watch(randomNumNotifierProvider);
    final random = Random();


    return Scaffold(
      appBar: AppBar(
        title: const Text("RiverPod Notifier Example App"),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                ...randomNumList.map((string) =>
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(bottom: 10,top: 5),
                      height: 30,
                        width: 300,
                        color: Colors.brown,
                        child: Text(string.toString(),
                          style: const TextStyle(
                            color: Colors.white
                          ),
                        )))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Generate'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown, // Background color
                  ),
                  onPressed: () {
                    ref.read(randomNumNotifierProvider.notifier).addString("This is the "
                        "random String ${5  + random.nextInt( 1000 + 1 - 5)}");
                  },
                ),

                ElevatedButton.icon(
                  icon: const Icon(Icons.clear),
                  label: const Text('Clear'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown, // Background color
                  ),
                  onPressed: () {
                    ref.read(randomNumNotifierProvider.notifier).removeString();
                  },
                )
              ],
            )
          ],
        ),
      ),

    );
  }
}
