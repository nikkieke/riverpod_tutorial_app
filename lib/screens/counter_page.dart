
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_test_app/screens/product_list_page.dart';
import 'package:my_test_app/screens/timer_page.dart';

import '../providers/counter_provider.dart';
import 'product_page.dart';
import 'random_string_page.dart';


class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final titleText = ref.watch(title);
    final counterProvider = ref.watch(counter);


    return Scaffold(
        backgroundColor: Colors.lightBlue,
        drawer:  Drawer(
          width: 200,
          backgroundColor: Colors.blueGrey,
          child: Container(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.new_label),
                  title: const Text("Future Provider",style: TextStyle(
                      color: Colors.white,  fontSize: 15)),
                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder:(context)=> const ProductListPage())),
                ),
                ListTile(
                  leading: const Icon(Icons.new_label),
                  title: const Text("Stream Provider",style: TextStyle(
                      color: Colors.white,  fontSize: 15)),
                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder:(context)=> const TimerPage())),
                ),

                ListTile(
                  leading: const Icon(Icons.new_label),
                  title: const Text("Notifier Provider",style: TextStyle(
                      color: Colors.white,  fontSize: 15)),
                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder:(context)=> const RandomStringPage())),
                ),

                ListTile(
                  leading: const Icon(Icons.new_label),
                  title: const Text("[Async] Notifier Provider",style: TextStyle(
                      color: Colors.white,  fontSize: 15)),
                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder:(context)=> const ProductPage())),
                ),


              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: const Text("RiverPod Example App"),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Padding(
                padding: const EdgeInsets.only(top: 30,bottom: 30),
                child: Text(titleText,
                        style: const TextStyle(
                            color: Colors.white,fontSize: 30)),
              ),

               Text(
                counterProvider.toString(),
                style: const TextStyle(color: Colors.white, height: 5, fontSize: 23),
              ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                     label: const Text('Add'),
                      onPressed: ()=> ref.watch(counter.notifier).state++,
                ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.remove),
                    label: const Text('Minus'),
                    onPressed: ()=> ref.watch(counter.notifier).state--,
                  ),
                ),

              ],
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.replay),
              label: const Text('Refresh'),
              onPressed: ()=> ref.watch(counter.notifier).state = 0,
            ),
          ],

          ),
        ));


  }

}



// class HomePage extends StatefulWidget {
//   const HomePage({
//     super.key,
//   });
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
// final title = Provider<String>((ref) => "Simple Counter");
//
// class _HomePageState extends State<HomePage> {
//   int _counter = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.lightBlue,
//         appBar: AppBar(
//           title: const Text("RiverPod Example App"),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Consumer(
//               builder: (context, watch, child) {
//                 final titleText = watch.watch(title).toString();
//                 return Text(titleText,
//                     style: const TextStyle(
//                         color: Colors.white, height: 10, fontSize: 18));
//               },
//             ),
//             const Text(
//               "0",
//               style: TextStyle(color: Colors.white, height: 5, fontSize: 18),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Padding(
//                 //     padding: const EdgeInsets.all(8),
//                 //     child: ElevatedButton.icon(
//                 //       icon: const Icon(Icons.add),
//                 //       label: const Text('Add'),
//                 //       onPressed: counter.increment,
//                 //     ),
//                 // ),
//                 //
//                 // Padding(
//                 //   padding: const EdgeInsets.all(8),
//                 //   child: ElevatedButton.icon(
//                 //     icon: const Icon(Icons.remove),
//                 //     label: const Text('Minus'),
//                 //     onPressed: counter.increment,
//                 //   ),
//                 // ),
//               ],
//             ),
//             // ElevatedButton.icon(
//             //   icon: const Icon(Icons.replay),
//             //   label: const Text('Add'),
//             //   onPressed: counter.increment,
//             // ),
//           ],
//         ));
//   }
// }
