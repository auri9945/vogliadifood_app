import 'package:flutter/material.dart';
import 'package:vogliadifood_app/widget/CustomNavbar.dart';

import '../utils/colors.dart';
import '../utils/helper.dart';
import 'CategorieScreen.dart';
import 'loginScreen.dart';

class ProfiloScreen extends StatelessWidget {
  static const routeName = "/profiloScreen";

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
                                  Expanded(
                                    child: Text(
                                      "Profilo",
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
                            height: 40,
                          ),
                          Container(
                            child: Text("Ciao Marino!",
                              style: Helper.getTheme(context).headline3,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          CustomTextInput(
                            hintText: 'nome',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextInput(
                            hintText: 'Cognome',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextInput(
                            hintText: 'Email',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextInput(
                            hintText: 'Indirizzo',
                          ),

                          SizedBox(
                            height: 30,
                          ),

                          Container(
                            height: 50,
                            width: 200,
                            child: ElevatedButton(
                              style: ButtonStyle(

                              ),
                              onPressed: (){},
                              child:
                              Text("Aggiorna profilo",
                              style: Helper.getTheme(context).headline5,),
                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          Text("or",
                            style: Helper.getTheme(context).headline5,
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          Container(
                            height: 50,
                            width: 200,
                            child: ElevatedButton(
                              onPressed: (){},
                              child:
                              Text("Logout",
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
                profilo: true,
              ),
          ),
        ],
      ),
    );
  }
}
