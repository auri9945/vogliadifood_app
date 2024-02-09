import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vogliadifood_app/screens/idividualItem.dart';
import 'package:vogliadifood_app/screens/paymentScreen.dart';
import 'package:vogliadifood_app/widget/rigaProdotti.dart';

import '../utils/colors.dart';
import '../utils/helper.dart';
import '../widget/CustomNavbar.dart';

class RiepilogoScreen extends StatelessWidget {
  static const routeName = "/riepilogoScreen";

  const RiepilogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Container(
                          padding: const EdgeInsets.only(top: 30),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: AppColors.Bianco,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Back",
                                    style: Helper.getTheme(context).titleLarge,
                                  ),
                                ),
                                Image.asset(
                                  Helper.getAssetName(
                                      "shopping_cart.png", "virtual"),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          child: Text(
                            "Riepilogo ordine",
                            style: Helper.getTheme(context).displaySmall,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        RigaProdotti(
                          prodotto: "pizza",
                          numero: "2",
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: ElevatedButton(
                            style: const ButtonStyle(),
                            onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed(
                                    PaymentScreen.routeName);
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
