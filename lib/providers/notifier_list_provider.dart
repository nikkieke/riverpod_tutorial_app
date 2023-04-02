
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'notifier_list_provider.g.dart';



@riverpod
class RandomNumNotifier extends _$RandomNumNotifier{
  @override
  List<String> build() {
    return [];
  }

  void addString(String randomNum){
    state = [...state, randomNum];
  }


  void removeString(){
    state = [];
  }


}





