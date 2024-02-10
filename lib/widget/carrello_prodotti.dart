import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vogliadifood_app/controller/carello_controller.dart';
import 'package:vogliadifood_app/model/piatti_api.dart';
import '../model/piatti.dart';
import '../utils/colors.dart';

class CarrelloProdotti extends StatelessWidget {
  final CarelloController controller = Get.find();

  CarrelloProdotti({Key? key}) : super(key: key);

  var arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Obx(
          () =>
      controller.product.length > 0 ?

          FutureBuilder(
              future: fetchPiatti(arguments),
              builder: (context, snapshot){
                if (snapshot.hasData) {
                ListView.builder(
                  itemCount: controller.product.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    Piatti product = controller.product[index];
                    return CarrelloProdottoItem(
                      controller: controller,
                      product: product,
                      //       quntity:controller.product.values.toList()[index],
                      index: index,
                    );
                  },
                );
              }
                return CircularProgressIndicator();
              })

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
    Key? key, required this.index, required this.controller, required this.product})
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
          Expanded(child: Text(
            '${product.descrizione}',
            style: TextStyle(
              fontSize: 15,
              color: AppColors.Bianco,
            ),
          ),
          ),


          Expanded(
            child: Text(
              '${product.prezzo}',
              style: TextStyle(
                fontSize: 15,
                color: AppColors.Orange,
                fontWeight: FontWeight.bold,
              ),
            ),),

          /* IconButton(
            onPressed: (){
              controller.removeProduct(product);              },
            icon: const Icon(Icons.remove_circle),
          ), */
          //    Text("$quantity"),
          IconButton(
            onPressed: () {
              controller.addPiatti(product);
            },
            icon: const Icon(Icons.add_circle),
          )
        ],
      ),


    );
  }
}

