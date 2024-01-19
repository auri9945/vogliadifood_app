import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vogliadifood_app/screens/idividualItem.dart';
import 'package:vogliadifood_app/widget/rigaProdotti.dart';

import '../utils/colors.dart';
import '../utils/helper.dart';
import '../widget/CustomNavbar.dart';
import 'CategorieScreen.dart';

class RiepilogoScreen extends StatelessWidget {
  static const routeName = "/riepilogoScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: Container(
                height: Helper.getScreenHeight(context),
                width: Helper.getScreenWidth(context),
                child: Stack(
                  children: [
                    Container(
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
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushReplacementNamed(IndividualItem.routeName);
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios_rounded,
                                      color: AppColors.Bianco,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Back",
                                      style: Helper.getTheme(context).headline6,
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
                            height: 50,
                          ),
                          Container(
                            child:
                            Text("Riepilogo ordine",
                              style: Helper.getTheme(context).headline3,
                            ),
                          ),

                          SizedBox(
                            height: 50,
                          ),
                          RigaProdotti(
                            prodotto: "pizza",
                            numero: "2",
                          ),

                          SizedBox(
                            height: 50,
                          ),

                          Container(
                            height: 50,
                            width: 200,
                            child: ElevatedButton(
                              style: ButtonStyle(
                              ),
                              onPressed: (){},

                              child:
                              Text("Procedi al pagamento",
                                style: Helper.getTheme(context).headline5,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ),



          Positioned(
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
