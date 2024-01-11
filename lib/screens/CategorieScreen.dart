import 'package:flutter/material.dart';
import 'package:vogliadifood_app/widget/CustomNavbar.dart';
import 'package:vogliadifood_app/widget/searchbar.dart';

import '../utils/helper.dart';

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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Categoria",
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
                    height: 20,
                  ),
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
