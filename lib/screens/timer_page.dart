import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/stream_count_provider.dart';

class TimerPage extends ConsumerWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final streamCount = ref.watch(timer);
    String twoDigits(int n,)=> n.toString().padLeft(2,"0");
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    String hours = twoDigits(duration.inHours);
    final _backGroundColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];


    return Scaffold(
      backgroundColor: _backGroundColor,
      //backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: const Text("Stream Provider"),
      ),
      body: Column(
          children: [
            streamCount.when(
            data: (value){
              return Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 40,right: 40,top: 50,bottom:20 ),
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 5,
                    )),
                child:  Text(
                  "$hours:$minutes:$seconds",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              );
    },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const Center(child: CircularProgressIndicator(color: Colors.white,)),
        ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(8),
            //       child: ElevatedButton.icon(
            //         icon: const Icon(Icons.stop),
            //         label: const Text('Stop'),
            //         onPressed: ()=> stopWatch.cancel,
            //       ),
            //     ),
            //
            //     Padding(
            //       padding: const EdgeInsets.all(8),
            //       child: ElevatedButton.icon(
            //         icon: const Icon(Icons.play_arrow),
            //         label: const Text('Start'),
            //         onPressed: ()=> ref.watch(timer),
            //       ),
            //     ),
            //
            //   ],
            // ),
      ]),
    );
  }
}
