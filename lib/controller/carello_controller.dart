import 'package:get/get.dart';
import 'package:vogliadifood_app/model/piatti.dart';


class CarelloController extends GetxController {
  final _piatti = {}.obs;

  void addPiatti(Piatti piatto){
    if(_piatti.containsKey(piatto.id)){
      _piatti[piatto.id] += 1;
    }else{
      _piatti[piatto.id] = 1;
    }
  }

}
