import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vogliadifood_app/controller/carello_controller.dart';
import 'package:vogliadifood_app/screens/idividualItem.dart';
import 'package:vogliadifood_app/screens/paymentScreen.dart';
import 'package:vogliadifood_app/widget/rigaProdotti.dart';


import '../model/bevande.dart';
import '../model/piatti.dart';
import '../utils/colors.dart';
import '../utils/helper.dart';
import '../widget/CustomNavbar.dart';
import '../widget/carrello_prodotti.dart';


class RiepilogoFinaleScreen extends StatelessWidget {
  static const routeName = "/riepilogoFinaleScreen";


  RiepilogoFinaleScreen({Key? key}) : super(key: key);
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          child: Text(
                            "Conferma ordine",
                            style: Helper.getTheme(context).displaySmall,
                          ),
                        ),
                        const SizedBox(height: 50),
                        // Mostra tutti i prodotti selezionati
                        Obx(() => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: controller.selectedProducts.map((product) {
                            return CarrelloPiattiRiepilogo(
                              product: product,
                            );
                          }).toList(),
                        ),),
                        Obx(() => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: controller.selectedBevande.map((product) {
                            return CarrelloBevandeiRiepilogo(
                              product: product,
                            );
                          }).toList(),
                        ),),
                        const SizedBox(height: 20),
                        // Visualizza il totale
                       // CartTotal(),
                    Container(
                      child: Obx(() => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 75),
                        child: Row(
                          children: [
                            const Text(
                              "Total:",
                              style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                            Text(
                              "${controller.calculateTotalPrice() } €",
                              style: const TextStyle(
                                  fontSize: 24,fontWeight: FontWeight.bold),),
                          ],
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
                                Get.toNamed("/confermaOrdine");
                              },
                            child: Text(
                              "Conferma pagamento",
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

class CarrelloPiattiRiepilogo extends StatelessWidget {
  final Piatti product;

  CarrelloPiattiRiepilogo(
      {Key? key,
        required this.product})
      :  super(key: key) {

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '${product.piatto}',
              style: TextStyle(
                fontSize: 20,
                color: AppColors.Bianco,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: Text(
              "${product.prezzo} €",
              style: TextStyle(
                fontSize: 15,
                color: AppColors.Orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CarrelloBevandeiRiepilogo extends StatelessWidget {
  final Bevande product;

  CarrelloBevandeiRiepilogo(
      {Key? key,
        required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '${product.bevanda}',
              style: TextStyle(
                fontSize: 20,
                color: AppColors.Bianco,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: Text(
              '${product.prezzo}€',
              style: TextStyle(
                fontSize: 15,
                color: AppColors.Orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
