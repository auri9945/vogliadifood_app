import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';
import 'package:vogliadifood_app/model/bevande.dart';
import 'package:vogliadifood_app/model/piatti.dart';
import 'package:vogliadifood_app/widget/carrello_prodotti.dart';



class CarelloController extends GetxController {
  final _product = {}.obs;
  final selectedProducts = <Piatti>[].obs;
  final selectedBevande = <Bevande>[]
      .obs; // Lista per memorizzare i prodotti selezionati

  RxDouble totalPrice = 0.0.obs;

  // Totale dei prezzi

  var _quantity = 1.obs;

  get quantity => _quantity;


  void addPiatti(Piatti product) {
    if (_product.containsKey(product.id)) {
      _product[product.id] += 1;
    } else {
      _product[product.id] = 1;
    }
    selectedProducts.add(product);
    // calculateTotalPrice(); // Aggiorna il totale dei prezzi
  }

  void addBevande(Bevande product) {
    if (_product.containsKey(product.id)) {
      _product[product.id] += 1;
    }
    else {
      _product[product.id] = 1;
    }
    selectedBevande.add(product);
    // calculateTotalPrice(); // Aggiorna il totale dei prezzi
  }

  get product => _product;

  void removePiatti(Piatti product) {
    _product.remove(product.id);
    selectedProducts.remove(product);
  }


  void removBevande(Bevande product) {
    _product.remove(product.id);
    selectedBevande.remove(product);
  }

  get selectProdotti => selectedProducts.length + selectedBevande.length;

  double calculateTotalPrice() {
    double total = 0.0;

    // Calcola il prezzo totale dei piatti
    total += selectedProducts.fold<double>(
      0.0,
          (previousValue, product) => previousValue + double.parse(product.prezzo),
    );

    // Calcola il prezzo totale delle bevande
    total += selectedBevande.fold<double>(
      0.0,
          (previousValue, product) => previousValue + double.parse(product.prezzo),
    );

    return total;
  }

}

