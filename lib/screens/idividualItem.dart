import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:vogliadifood_app/model/bevande.dart';
import 'package:vogliadifood_app/model/bevande_api.dart';
import 'package:vogliadifood_app/model/piatti.dart';
import 'package:vogliadifood_app/model/piatti_api.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:vogliadifood_app/model/ristoranti.dart';
import 'package:vogliadifood_app/model/ristoranti_api.dart';
import 'package:vogliadifood_app/screens/riepilogoScreen.dart';

import '../controller/carello_controller.dart';
import '../utils/colors.dart';
import '../utils/helper.dart';
import '../widget/CustomNavbar.dart';
import '../widget/rigaProdotti.dart';
import 'CategorieScreen.dart';
import 'package:http/http.dart' as http;

class IndividualItem extends StatefulWidget {
  static const routeName = "/idividualItem.dart";
  const IndividualItem({Key? key}); //: super(key: key);

  //String? get arguments => null;
  @override
  _IndividualItem createState() => _IndividualItem();
}
class _IndividualItem extends State<IndividualItem> {
  final controller = Get.put(CarelloController());
  late final int index;
  final arguments = Get.arguments;





  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CarelloController());
    late final int index;
    final arguments = Get.arguments;


    //print(arguments);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vogliadì"),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25, top: 9),
            child: Obx(
                  () => InkWell(
                  onTap: () => Get.to(() => RiepilogoScreen()),
                  child: badges.Badge(
                      badgeContent: Text(
                        "${controller.selectProdotti}",
                       style: TextStyle(color: AppColors.Bianco),
                      ),
                      badgeStyle: badges.BadgeStyle(
                        padding: const EdgeInsets.all(3.10),
                      ),
                      showBadge: controller.selectedProducts.length + controller.selectedBevande.length > 0,
                      position: BadgePosition.topEnd(top: -10, end: 20),
                      child: const Icon(Icons.shopping_cart_outlined))),
            ),
          ),
        ],
      ),
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
                          SizedBox(
                            width: double.infinity,
                            height: 250,
                            child: Image.asset(
                              Helper.getAssetName(
                                  "VogliaDiSchifezze.jpg", "virtual"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            child: Text(
                              "Menù",
                              style: Helper.getTheme(context).displaySmall,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              child:FutureBuilder(
                                future: fetchPiatti(arguments),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                      itemCount: snapshot.data?.length,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        Piatti product = snapshot.data![index];
                                        return Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                '${product.piatto}',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: AppColors.Bianco,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                '${product.descrizione}',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: AppColors.Bianco,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                '${product.prezzo}',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: AppColors.Orange,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              ElevatedButton(
                                                onPressed: (() {
                                                  controller.addPiatti(product);
                                                }),

                                                child: Text(
                                                  "+ Aggiungi al carello",
                                                  style:
                                                      Helper.getTheme(context)
                                                          .headline5,
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }
    return CircularProgressIndicator();

                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: Text(
                              "Bevande",
                              style: Helper.getTheme(context).titleLarge,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              child: FutureBuilder(
                                future: fetchBevande(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data?.length,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        Bevande bevande = snapshot.data![index];
                                        return Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                '${bevande.bevanda}',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: AppColors.Bianco,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                '${bevande.prezzo}',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: AppColors.Bianco,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              ElevatedButton(
                                                onPressed: (() {
                                                  controller.addBevande(bevande);
                                                }),
                                                child: Text(
                                                  "+ Aggiungi al carello",
                                                  style:
                                                      Helper.getTheme(context)
                                                          .headline5,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }
                                  return CircularProgressIndicator();
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
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
