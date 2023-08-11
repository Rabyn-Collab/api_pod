
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';





final countProvider = Provider((ref) => 90000);

final countsPro = ChangeNotifierProvider((ref) => CountProvider());

final countState = StateProvider((ref) => 0);

class CountProvider extends  ChangeNotifier{

  int count = 0;


  void increment(){
    count++;
    notifyListeners();
  }

  void decrement(){
   count--;
   notifyListeners();
  }


}









