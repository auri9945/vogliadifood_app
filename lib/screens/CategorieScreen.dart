import 'package:flutter/material.dart';
import 'package:vogliadifood_app/screens/dolciScreen.dart';
import 'package:vogliadifood_app/screens/schifezzeScreen.dart';
import 'package:vogliadifood_app/widget/CustomNavbar.dart';
import 'package:vogliadifood_app/widget/searchbar.dart';

import '../utils/helper.dart';
import '../widget/categorieVoglia.dart';

class CategorieScreen extends StatelessWidget {
  static const routeName = "/categorieScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SafeArea(
          child: Container(
            height: Helper.getScreenHeight(context),
            width: Helper.getScreenWidth(context),
            child: Stack(children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  Helper.getAssetName("Sfondo_app2.png", "virtual"),
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Categorie",
                          style: Helper.getTheme(context).headline6,
                        ),
                        Image.asset(
                          Helper.getAssetName(
                              "shopping_cart.png", "virtual"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SearchBarBox(),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Ho voglia dì..",
                      style: Helper.getTheme(context).headline6,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    height: 500,
                    padding: const EdgeInsets.only(left: 30),
                    child:Column(
                      children: [
                        Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pushReplacementNamed(SchifezzeScreen.routeName);
                                },
                                child: CategiarieVoglia(
                                  image: Image.asset(
                                    Helper.getAssetName(
                                        "Ellipse_5.png",
                                        "virtual"),
                                    //fit: BoxFit.cover,
                                  ),
                                  name: "Schifezze",
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pushReplacementNamed(DolciScreen.routeName);
                                },
                                child: CategiarieVoglia(
                                  image: Image.asset(
                                    Helper.getAssetName(
                                        "Ellipse_1.png",
                                        "virtual"),
                                    fit: BoxFit.cover,
                                  ),
                                  name: "Dolci",
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),

                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pushReplacementNamed(SchifezzeScreen.routeName);
                                },
                                child:  CategiarieVoglia(
                                  image: Image.asset(
                                    Helper.getAssetName(
                                        "Ellipse_2.png",
                                        "virtual"),
                                    fit: BoxFit.cover,
                                  ),
                                  name: "Veggie",
                                ),
                              ),
                            ]
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                              children: [
                                GestureDetector(
                                  onTap: (){},
                                  child: CategiarieVoglia(
                                    image: Image.asset(
                                      Helper.getAssetName(
                                          "Ellipse 3.png",
                                          "virtual"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "Mondo",
                                  ),
                                ),

                                SizedBox(
                                  width: 15,
                                ),

                                GestureDetector(
                                  onTap: (){},
                                  child: CategiarieVoglia(
                                    image: Image.asset(
                                      Helper.getAssetName(
                                          "Ellipse 4.png",
                                          "virtual"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "Salutare",
                                  ),
                                ),

                                SizedBox(
                                  width: 15,
                                ),

                                GestureDetector(
                                  onTap: (){},
                                  child: CategiarieVoglia(
                                    image: Image.asset(
                                      Helper.getAssetName(
                                          "Ellipse_6.png",
                                          "virtual"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "Mare",
                                  ),
                                ),

                              ]
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                              children: [
                                GestureDetector(
                                  onTap: (){},
                                  child: CategiarieVoglia(
                                    image: Image.asset(
                                      Helper.getAssetName(
                                          "Ellipse_7.png",
                                          "virtual"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "Casa",
                                  ),
                                ),

                                SizedBox(
                                  width: 15,
                                ),

                                GestureDetector(
                                  onTap: (){},
                                  child: CategiarieVoglia(
                                    image: Image.asset(
                                      Helper.getAssetName(
                                          "Ellipse_8.png",
                                          "virtual"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "Fushion",
                                  ),
                                ),

                                SizedBox(
                                  width: 15,
                                ),

                                GestureDetector(
                                  onTap: (){},
                                  child: CategiarieVoglia(
                                    image: Image.asset(
                                      Helper.getAssetName(
                                          "Ellipse_9.png",
                                          "virtual"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "Gourmet",
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ],
                    )
                  )
                ],
              ),
            ]),
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
