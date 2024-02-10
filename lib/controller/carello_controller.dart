import 'package:get/get.dart';
import 'package:vogliadifood_app/model/piatti.dart';


class CarelloController extends GetxController {
  final _piatti = {}.obs;

  void addPiatti(Piatti product){
    if(_piatti.containsKey(product.id)){
      _piatti[product.id] += 1;
    }else{
      _piatti[product.id] = 1;
    }
  }
  get product => _piatti;
}
