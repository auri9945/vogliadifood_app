
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/carello_controller.dart';

class CartTotal extends StatelessWidget {
  final CarelloController controller = Get.find<CarelloController>();
  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      Get.put(CarelloController());}
      return Obx(
          ()=> Container(
        padding: const EdgeInsets.symmetric(horizontal: 75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total",
              style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            Text(
              "${controller.totalPrice.value}",
              style: const TextStyle(
                  fontSize: 24,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
