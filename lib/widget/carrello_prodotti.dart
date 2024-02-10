import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vogliadifood_app/controller/carello_controller.dart';

import '../model/piatti.dart';

class CarrelloProdotti extends StatelessWidget {
  final CarelloController controller = Get.find();
  CarrelloProdotti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
        () =>
            controller.product.length>0 ?ListView.builder(
              itemCount: controller.product.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index){
                return CarrelloProdottoItem(
                  controller: controller,
                  product:controller.product.key.toList()[index],
         //       quntity:controller.product.values.toList()[index],
                  index: index,
                );
              },
            ) :const SizedBox(
              height:800,
              child: Center (
                child: Text("carrello vuoto")
              ),
            ),
    );
  }
}


class CarrelloProdottoItem extends StatelessWidget{
  final CarelloController controller;
  final Piatti product;
 // final int quantity;
  final int index;
  const CarrelloProdottoItem({
    Key? key,required this.index,required this.controller,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Expanded(
              child: Text(product.piatto,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )
          ),
         /* IconButton(
            onPressed: (){
              controller.removeProduct(product);              },
            icon: const Icon(Icons.remove_circle),
          ), */
      //    Text("$quantity"),
          IconButton(
            onPressed: (){
              controller.addPiatti(product);              },
            icon: const Icon(Icons.add_circle),
          )
        ],
      ),



  );
}
}

