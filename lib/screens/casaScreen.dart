import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';
import 'package:badges/badges.dart' as badges;
import 'package:vogliadifood_app/model/ristoranti.dart';
import 'package:vogliadifood_app/screens/CategorieScreen.dart';
import 'package:vogliadifood_app/screens/riepilogoScreen.dart';
import 'package:vogliadifood_app/utils/colors.dart';
import 'package:vogliadifood_app/widget/ListaRistorantiCategorie.dart';

import '../controller/carello_controller.dart';
import '../model/ristoranti_api.dart';
import '../utils/helper.dart';
import '../widget/CustomNavbar.dart';
import 'idividualItem.dart';

class CasaScreen extends StatefulWidget {
  static const routeName = "/casaScreen";

  const CasaScreen({super.key});

  @override
  _CasaScreen createState() => _CasaScreen();
}

class _CasaScreen extends State<CasaScreen> {
  var arguments = Get.arguments;
  var categoriaRistorante = "casa";
  final controller = Get.put(CarelloController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vogliadì Casa"),
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
                         SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 250,
                            child: Image.asset(
                              Helper.getAssetName(
                                  "vogliadicasa.jpg", "virtual"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "“Hai mangiato? È la più autentica espressione d’amore.”",
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
                            child: FutureBuilder(
                                future: fetchReadOneR(categoriaRistorante),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                        itemCount: snapshot.data?.length,
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          Ristoranti ristorante =
                                              snapshot.data![index];
                                          return Row(
                                            children: <Widget>[
                                              GestureDetector(
                                                child: ListaRistorantiCategorie(
                                                  image: Image.asset(
                                                    Helper.getAssetName(
                                                        "casa.png", "virtual"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  name: "Cà Dij Mat",
                                                  categoria: "ristorante",
                                                  rate: '5',
                                                ),
                                                onTap: () {

                                                  Get.toNamed(('/idividualItem.dart'),
                                                      arguments:
                                                          '${ristorante.id}');
                                                },
                                              ),
                                            ],
                                          );
                                        });
                                  }
                                  return CircularProgressIndicator();
                                }),
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
