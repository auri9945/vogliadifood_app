import 'package:get/get.dart';
import 'package:vogliadifood_app/model/bevande.dart';
import 'package:vogliadifood_app/model/piatti.dart';
import 'package:vogliadifood_app/widget/cart_total.dart';

class CarelloController extends GetxController {
  final _product = {}.obs;
  final selectedProducts = <Piatti>[].obs;
  final selectedBevande = <Bevande>[].obs;// Lista per memorizzare i prodotti selezionati
  RxDouble totalPrice = 0.0.obs; // Totale dei prezzi

  void addPiatti(Piatti product) {
    if(_product.containsKey(product.id)){
      _product[product.id] += 1;

    } else {
      _product[product.id] = 1;
    }
    selectedProducts.add(product);
    calculateTotalPrice(); // Aggiorna il totale dei prezzi
  }

  void addBevande (Bevande product) {
    if(_product.containsKey(product.id)){
      _product[product.id] += 1;
    }
    else {
      _product[product.id] = 1;
    }
    selectedBevande.add(product);
    calculateTotalPrice(); // Aggiorna il totale dei prezzi
  }

  get product => _product;

  void removePiatti(Piatti product) {
    _product.remove(product.id);
    selectedProducts.remove(product);
    calculateTotalPrice();
  }

  void removBevande(Bevande product) {
    _product.remove(product.id);
    selectedBevande.remove(product);
    calculateTotalPrice();
  }


  get productSubtotal => _product.entries.map((product) => product.key.prezzo * product.value).toList();

  void calculateTotalPrice() {
    totalPrice.value = selectedProducts.fold<double>(
      0.0,
          (previousValue, product) => previousValue + double.parse(product.prezzo),
    );
  }



}

  // double get total {
  //   return _piatti.entries.isNotEmpty
  //       ? _piatti.entries
  //       .map((entry) => entry.key.price * entry.value)
  //       .reduce((value, element) => value + element)
  //       : 0.0;
  // }


