import 'package:flutter/material.dart';
import 'package:vogliadifood_app/screens/homeScreen.dart';
import 'package:vogliadifood_app/utils/colors.dart';

import '../utils/helper.dart';
import '../widget/CustomNavbar.dart';

class SchifezzeScreen extends StatelessWidget {
  static const routeName = "/schifezzeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
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
                                  GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.arrow_back_ios_rounded,
                                      color: AppColors.Bianco,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Categorie",
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
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            height: 250,
                            child: Image.asset(
                              Helper.getAssetName(
                                  "VogliaDiSchifezze.jpg", "virtual"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Ordina un pasto che ti migliori la giornata senza i sensi di colpa!",
                              style: Helper.getTheme(context).headline5,
                            ),
                          ),
                          SizedBox(
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
                                  ListaRistorantiCategorie(
                                    image: Image.asset(
                                      Helper.getAssetName(
                                          "kfc.png", "virtual"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "Kfc",
                                    categoria: "Fast Food",
                                    rate: '4',
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ListaRistorantiCategorie(
                                    image: Image.asset(
                                      Helper.getAssetName(
                                          "mc.png", "virtual"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "McDonalds",
                                    categoria: "Fast Food",
                                    rate: '4.5',
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

class ListaRistorantiCategorie extends StatelessWidget {
  const ListaRistorantiCategorie({
    Key? key,
    required Image image,
    required String name,
    required String rate,
    required String categoria,
  }) : _image = image,
        _name = name,
        _rate = rate,
        _categoria = categoria,
        super(key: key);

  final Image _image;
  final String _name;
  final String _rate;
  final String _categoria;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 200,
            height: 200,
            child: _image
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          _name,
          style: Helper.getTheme(context)
              .headline5
              ?.copyWith(color: AppColors.Bianco),
        ),
        Row(
          children: [
            Image.asset(
              Helper.getAssetName(
                  "star_filled.png", "virtual"),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              _rate,
              style: TextStyle(
                color: AppColors.Orange,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 5.0,
              ),
              child: Text(
                ".",
                style: TextStyle(
                  color: AppColors.Rosso,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(_categoria),
          ],
        ),
      ],
    );
  }
}
