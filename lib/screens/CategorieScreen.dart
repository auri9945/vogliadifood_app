import 'package:flutter/material.dart';
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
                    height: 40,
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SearchBarBox(),
                  SizedBox(
                    height: 50,
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
                              CategiarieVoglia(
                                image: Image.asset(
                                  Helper.getAssetName(
                                      "Ellipse_5.png",
                                      "virtual"),
                                  fit: BoxFit.cover,
                                ),
                                name: "Fast Food",
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              CategiarieVoglia(
                                image: Image.asset(
                                  Helper.getAssetName(
                                      "cheeseburger-gourmet-alla-griglia-su-tavolo-in-legno-rustico-generato-da-ai.jpg",
                                      "virtual"),
                                  fit: BoxFit.cover,
                                ),
                                name: "Fast Food",
                              ),
                              SizedBox(
                                width: 15,
                              ),CategiarieVoglia(
                                image: Image.asset(
                                  Helper.getAssetName(
                                      "cheeseburger-gourmet-alla-griglia-su-tavolo-in-legno-rustico-generato-da-ai.jpg",
                                      "virtual"),
                                  fit: BoxFit.cover,
                                ),
                                name: "Fast Food",
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ]
                        ),

                        Row(
                            children: [
                              CategiarieVoglia(
                                image: Image.asset(
                                  Helper.getAssetName(
                                      "cheeseburger-gourmet-alla-griglia-su-tavolo-in-legno-rustico-generato-da-ai.jpg",
                                      "virtual"),
                                  fit: BoxFit.cover,
                                ),
                                name: "Fast Food",
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              CategiarieVoglia(
                                image: Image.asset(
                                  Helper.getAssetName(
                                      "cheeseburger-gourmet-alla-griglia-su-tavolo-in-legno-rustico-generato-da-ai.jpg",
                                      "virtual"),
                                  fit: BoxFit.cover,
                                ),
                                name: "Fast Food",
                              ),
                              SizedBox(
                                width: 15,
                              ),CategiarieVoglia(
                                image: Image.asset(
                                  Helper.getAssetName(
                                      "cheeseburger-gourmet-alla-griglia-su-tavolo-in-legno-rustico-generato-da-ai.jpg",
                                      "virtual"),
                                  fit: BoxFit.cover,
                                ),
                                name: "Fast Food",
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ]
                        ),

                        Row(
                            children: [
                              CategiarieVoglia(
                                image: Image.asset(
                                  Helper.getAssetName(
                                      "cheeseburger-gourmet-alla-griglia-su-tavolo-in-legno-rustico-generato-da-ai.jpg",
                                      "virtual"),
                                  fit: BoxFit.cover,
                                ),
                                name: "Fast Food",
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              CategiarieVoglia(
                                image: Image.asset(
                                  Helper.getAssetName(
                                      "cheeseburger-gourmet-alla-griglia-su-tavolo-in-legno-rustico-generato-da-ai.jpg",
                                      "virtual"),
                                  fit: BoxFit.cover,
                                ),
                                name: "Fast Food",
                              ),
                              SizedBox(
                                width: 15,
                              ),CategiarieVoglia(
                                image: Image.asset(
                                  Helper.getAssetName(
                                      "cheeseburger-gourmet-alla-griglia-su-tavolo-in-legno-rustico-generato-da-ai.jpg",
                                      "virtual"),
                                  fit: BoxFit.cover,
                                ),
                                name: "Fast Food",
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ]
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
    ));
  }
}
