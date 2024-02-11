import 'package:get/get.dart';
import 'package:collection/collection.dart';
import 'package:vogliadifood_app/model/bevande.dart';
import 'package:vogliadifood_app/model/piatti.dart';
import 'package:vogliadifood_app/widget/cart_total.dart';


class CarelloController extends GetxController {
  final _product = {}.obs;
  final selectedProducts = <Piatti>[].obs;
  final selectedBevande = <Bevande>[].obs;// Lista per memorizzare i prodotti selezionati

  RxDouble totalPrice = 0.0.obs;
  // Totale dei prezzi

   var _quantity = 1.obs;
   get quantity => _quantity;

void incrementoProduct(bool isIncrement, Piatti product){
  //print("increment"+_quantity.toString());
  if(isIncrement){
    _quantity[product.id]= _quantity+1;
  } else if (_quantity<=0){
    _quantity  = 0.obs;
  }
  else {
    _quantity = _quantity-1;
    //print("decrement"+_quantity.toString());
  }
  update();
}

  void incrementoBevande(bool isIncrement){
    //print("increment"+_quantity.toString());
    if(isIncrement){
      _quantity = _quantity+1;
    } else if (_quantity<=0){
      _quantity  = 0.obs;
    } else {
      _quantity = _quantity-1;
      //print("decrement"+_quantity.toString());
    }
    update();
  }

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

  get selectProdotti => selectedProducts.length + selectedBevande.length;

  void calculateTotalPrice() {
    totalPrice.value = selectedProducts.fold<double>(
      0.0,
          (previousValue, product) => previousValue + double.parse(product.prezzo),
    );
  }



}

  // double get total {
  //   return _product.entries.isNotEmpty
  //       ? _product.entries
  //       .map((entry) => entry.key.price * entry.value)
  //       .reduce((value, element) => value + element)
  //       : 0.0;
  // }


