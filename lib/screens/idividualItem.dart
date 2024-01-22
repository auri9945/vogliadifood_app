import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/helper.dart';
import '../widget/CustomNavbar.dart';
import '../widget/rigaProdotti.dart';
import 'CategorieScreen.dart';

class IndividualItem extends StatelessWidget {
  static const routeName = "/idividualItem.dart";

  const IndividualItem({super.key});

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
                        fit: BoxFit.cover,
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed(
                                      CategorieScreen.routeName);
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios_rounded,
                                  color: AppColors.Bianco,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Nome Risotante",
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
                      SizedBox(
                        width: double.infinity,
                        height: 250,
                        child: Image.asset(
                          Helper.getAssetName(
                              "VogliaDiSchifezze.jpg", "virtual"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        child:
                        Text("Menù",
                          style: Helper.getTheme(context).displaySmall,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const RigaProdotti(
                        prodotto: "pizza",
                        numero: "o",
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        child:
                        Text("Bevande",
                          style: Helper.getTheme(context).titleLarge,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      const RigaProdotti(
                          prodotto: "Cola Cola",
                          numero: "1"),
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


