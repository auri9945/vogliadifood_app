import 'package:flutter/material.dart';
import 'package:vogliadifood_app/screens/CategorieScreen.dart';
import 'package:vogliadifood_app/screens/idividualItem.dart';
import 'package:vogliadifood_app/screens/riepilogoScreen.dart';
import 'package:vogliadifood_app/utils/colors.dart';
import 'package:vogliadifood_app/widget/ListaRistorantiCategorie.dart';

import '../utils/helper.dart';
import '../widget/CustomNavbar.dart';

class SchifezzeScreen extends StatelessWidget {
  static const routeName = "/schifezzeScreen";

  const SchifezzeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
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
                                      Navigator.of(context).pushReplacementNamed(CategorieScreen.routeName);
                                    },
                                    child: const Icon(
                                      Icons.arrow_back_ios_rounded,
                                      color: AppColors.Bianco,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Categorie",
                                      style: Helper.getTheme(context).titleLarge,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).pushReplacementNamed(RiepilogoScreen.routeName);
                                    },
                                    child: Image.asset(
                                      Helper.getAssetName(
                                          "shopping_cart.png", "virtual"),
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 250,
                            child: Image.asset(
                              Helper.getAssetName(
                                  "vogliadischifezze.jpg", "virtual"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Ordina un pasto che ti migliori la giornata senza i sensi di colpa!",
                              style: Helper.getTheme(context).headlineSmall,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: double.infinity,
                            height: 300,
                            padding: const EdgeInsets.only(left: 20),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).pushReplacementNamed(IndividualItem.routeName);
                                    },
                                    child: ListaRistorantiCategorie(
                                      image: Image.asset(
                                        Helper.getAssetName(
                                            "kfc.png", "virtual"),
                                        fit: BoxFit.cover,
                                      ),
                                      name: "Kfc",
                                      categoria: "Fast Food",
                                      rate: '4',
                                    ),
                                  ),

                                  const SizedBox(
                                    width: 20,
                                  ),
                                  GestureDetector(
                                    child:ListaRistorantiCategorie(
                                      image: Image.asset(
                                        Helper.getAssetName(
                                            "mc.png", "virtual"),
                                        fit: BoxFit.cover,
                                      ),
                                      name: "McDonalds",
                                      categoria: "Fast Food",
                                      rate: '4.5',
                                    ),
                                  ),

                                ],
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

