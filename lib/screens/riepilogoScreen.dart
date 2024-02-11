import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vogliadifood_app/controller/carello_controller.dart';
import 'package:vogliadifood_app/screens/idividualItem.dart';
import 'package:vogliadifood_app/screens/paymentScreen.dart';
import 'package:vogliadifood_app/widget/rigaProdotti.dart';
import 'package:vogliadifood_app/widget/cart_total.dart';

import '../utils/colors.dart';
import '../utils/helper.dart';
import '../widget/CustomNavbar.dart';
import '../widget/carrello_prodotti.dart';
import '../widget/cart_total.dart';

class RiepilogoScreen extends StatelessWidget {
  static const routeName = "/riepilogoScreen";

  RiepilogoScreen({Key? key}) : super(key: key);
  final controller = Get.put(CarelloController());
  var arguments = Get.arguments;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Carrello"),elevation: 0,),
      body: Stack(
        children: [
          SafeArea(
            child: SizedBox(
              height: Helper.getScreenHeight(context),
              width: Helper.getScreenWidth(context),
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      Helper.getAssetName("Sfondo_app2.png", "virtual"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          child: Text(
                            "Riepilogo ordine",
                            style: Helper.getTheme(context).displaySmall,
                          ),
                        ),
                        const SizedBox(height: 50),
                        // Mostra tutti i prodotti selezionati
                        Obx(() => Column(
                          children: controller.selectedProducts.map((product) {
                            return CarrelloPiattiItem(
                              controller: controller,
                              product: product,
                              index: controller.selectedProducts.indexOf(product),
                            );
                          }).toList(),
                        ),),
                        Obx(() => Column(
                          children: controller.selectedBevande.map((product) {
                            return CarrelloBevandeiItem(
                              controller: controller,
                              product: product,
                              index: controller.selectedBevande.indexOf(product),
                            );
                          }).toList(),
                        ),),
                        const SizedBox(height: 20),
                        // Visualizza il totale
                       // CartTotal(),
                    Container(
                      child: Obx(() => Text(
                        "Totale: \€${controller.totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                            ),
                          ),
                      )),
                        const SizedBox(height: 50),
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: ElevatedButton(
                            style: const ButtonStyle(),
                            onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed(PaymentScreen.routeName);
                              },
                            child: Text(
                              "Procedi al pagamento",
                              style: Helper.getTheme(context).headlineSmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavbar(
              categorie: true,
            ),
          ),
        ],
      ),
    );
  }
}

