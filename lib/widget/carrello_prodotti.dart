import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vogliadifood_app/controller/carello_controller.dart';
import 'package:vogliadifood_app/model/piatti_api.dart';
import '../model/piatti.dart';
import '../utils/colors.dart';


class CarrelloProdotti extends StatelessWidget {
  final CarelloController controller = Get.find();
  CarrelloProdotti({Key? key, required this.arguments}) : super(key: key);

  final dynamic arguments;

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.selectedProducts.isNotEmpty
        ? FutureBuilder<List<Piatti>>(
          future: fetchPiatti(arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text(
                'Errore durante il recupero dei dati: ${snapshot.error}');
          } else if (snapshot.hasData && snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                Piatti product = snapshot.data![index];
                return CarrelloProdottoItem(
                  controller: controller,
                  product: product,
                  index: index,
                );
              },
            );
          } else {
            return Text('Nessun dato disponibile');
          }
          //  return CircularProgressIndicator();
        },
              )

       : const SizedBox(
        height: 800,
        child: Center(
            child: Text("carrello vuoto")
        ),
      ),
    );
  }
}


class CarrelloProdottoItem extends StatelessWidget {
  final CarelloController controller;
  final Piatti product;
  // final int quantity;
  final int index;

  const CarrelloProdottoItem({
    Key? key,
    required this.index,
    required this.controller,
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
              '${product.piatto}',
              style: TextStyle(
                fontSize: 20,
                color: AppColors.Bianco,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Expanded(child: Text(
          //   '${product.descrizione}',
          //   style: TextStyle(
          //     fontSize: 15,
          //     color: AppColors.Bianco,
          //   ),
          // ),
          // ),


          Expanded(
            child: Text(
              '${product.prezzo}',
              style: TextStyle(
                fontSize: 15,
                color: AppColors.Orange,
                fontWeight: FontWeight.bold,
              ),
            ),),

          IconButton(
            onPressed: (){
              controller.removePiatti(product);              },
            icon:  Icon(Icons.delete),
          ), //*/
          //    Text("$quantity"),
        ],
      ),


    );
  }
}

