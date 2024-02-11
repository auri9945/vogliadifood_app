import 'package:get/get.dart';
import 'package:vogliadifood_app/model/piatti.dart';
import 'package:vogliadifood_app/widget/cart_total.dart';

class CarelloController extends GetxController {
  final _piatti = {}.obs;
  final selectedProducts = <Piatti>[].obs; // Lista per memorizzare i prodotti selezionati
  RxDouble totalPrice = 0.0.obs; // Totale dei prezzi

  void addPiatti(Piatti product) {
    if(_piatti.containsKey(product.id)){
      _piatti[product.id] += 1;
    } else {
      _piatti[product.id] = 1;
    }
    selectedProducts.add(product);
    calculateTotalPrice(); // Aggiorna il totale dei prezzi
  }

  void removePiatti(Piatti product) {
    _piatti.remove(product.id);
    selectedProducts.remove(product);
    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    totalPrice.value = selectedProducts.fold<double>(
      0.0,
          (previousValue, product) => previousValue + double.parse(product.prezzo),
    );
  }
  get product => _piatti;
}

  // double get total {
  //   return _piatti.entries.isNotEmpty
  //       ? _piatti.entries
  //       .map((entry) => entry.key.price * entry.value)
  //       .reduce((value, element) => value + element)
  //       : 0.0;
  // }


