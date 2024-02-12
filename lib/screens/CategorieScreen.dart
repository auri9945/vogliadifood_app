import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';
import 'package:badges/badges.dart' as badges;
import 'package:vogliadifood_app/screens/casaScreen.dart';
import 'package:vogliadifood_app/screens/dolciScreen.dart';
import 'package:vogliadifood_app/screens/fusionScreen.dart';
import 'package:vogliadifood_app/screens/gourmetScreen.dart';
import 'package:vogliadifood_app/screens/mareScreen.dart';
import 'package:vogliadifood_app/screens/mondoScreen.dart';
import 'package:vogliadifood_app/screens/riepilogoScreen.dart';
import 'package:vogliadifood_app/screens/salutareScreen.dart';
import 'package:vogliadifood_app/screens/schifezzeScreen.dart';
import 'package:vogliadifood_app/screens/veggieScreen.dart';
import 'package:vogliadifood_app/widget/CustomNavbar.dart';
import 'package:vogliadifood_app/widget/searchbar.dart';

import '../controller/carello_controller.dart';
import '../utils/colors.dart';
import '../utils/helper.dart';
import '../widget/categorieVoglia.dart';

class CategorieScreen extends StatelessWidget {
  static const routeName = "/categorieScreen";

  CategorieScreen({super.key});

  final controller = Get.put(CarelloController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categorie"),
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
                      showBadge: controller.selectedProducts.length +
                              controller.selectedBevande.length >
                          0,
                      position: BadgePosition.topEnd(top: -10, end: 20),
                      child: const Icon(Icons.shopping_cart_outlined))),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SafeArea(
            child: SizedBox(
              height: Helper.getScreenHeight(context),
              width: Helper.getScreenWidth(context),
              child: Stack(children: [
                SizedBox(
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Ho voglia dì..",
                        style: Helper.getTheme(context).titleLarge,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                        width: double.infinity,
                        height: 500,
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          children: [
                            Row(children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacementNamed(
                                      SchifezzeScreen.routeName);
                                },
                                child: CategiarieVoglia(
                                  image: Image.asset(
                                    Helper.getAssetName(
                                        "Ellipse_5.png", "virtual"),
                                    //fit: BoxFit.cover,
                                  ),
                                  name: "Schifezze",
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacementNamed(
                                      DolciScreen.routeName);
                                },
                                child: CategiarieVoglia(
                                  image: Image.asset(
                                    Helper.getAssetName(
                                        "Ellipse_1.png", "virtual"),
                                    fit: BoxFit.cover,
                                  ),
                                  name: "Dolci",
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacementNamed(
                                      VeggieScreen.routeName);
                                },
                                child: CategiarieVoglia(
                                  image: Image.asset(
                                    Helper.getAssetName(
                                        "Ellipse_2.png", "virtual"),
                                    fit: BoxFit.cover,
                                  ),
                                  name: "Veggie",
                                ),
                              ),
                            ]),
                            const SizedBox(
                              width: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        MondoScreen.routeName);
                                  },
                                  child: CategiarieVoglia(
                                    image: Image.asset(
                                      Helper.getAssetName(
                                          "Ellipse 3.png", "virtual"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "Mondo",
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        SalutareScreen.routeName);
                                  },
                                  child: CategiarieVoglia(
                                    image: Image.asset(
                                      Helper.getAssetName(
                                          "Ellipse 4.png", "virtual"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "Salutare",
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        MareScreen.routeName);
                                  },
                                  child: CategiarieVoglia(
                                    image: Image.asset(
                                      Helper.getAssetName(
                                          "Ellipse_6.png", "virtual"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "Mare",
                                  ),
                                ),
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        CasaScreen.routeName);
                                  },
                                  child: CategiarieVoglia(
                                    image: Image.asset(
                                      Helper.getAssetName(
                                          "Ellipse_7.png", "virtual"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "Casa",
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        FusionScreen.routeName);
                                  },
                                  child: CategiarieVoglia(
                                    image: Image.asset(
                                      Helper.getAssetName(
                                          "Ellipse_8.png", "virtual"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "Fushion",
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        GourmetScreen.routeName);
                                  },
                                  child: CategiarieVoglia(
                                    image: Image.asset(
                                      Helper.getAssetName(
                                          "Ellipse_9.png", "virtual"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "Gourmet",
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ))
                  ],
                ),
              ]),
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
