import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vogliadifood_app/screens/CategorieScreen.dart';
import 'package:vogliadifood_app/utils/colors.dart';
import 'package:vogliadifood_app/widget/ListaRistorantiCategorie.dart';

import '../model/ristoranti.dart';
import '../model/ristoranti_api.dart';
import '../utils/helper.dart';
import '../widget/CustomNavbar.dart';
import 'idividualItem.dart';

class FusionScreen extends StatefulWidget {
  static const routeName = "/fusionScreen";

  const FusionScreen({super.key});

  @override
  _FusionScreen createState() => _FusionScreen();
}

class _FusionScreen extends State<FusionScreen> {
  var arguments = Get.arguments;
  var categoriaRistorante = "fushion";

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
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                    ),
                                    child: const Icon(
                                      Icons.arrow_back_ios_rounded,
                                      color: AppColors.Bianco,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Categorie",
                                      style:
                                          Helper.getTheme(context).titleLarge,
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
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 250,
                            child: Image.asset(
                              Helper.getAssetName(
                                  "vogliadifusion.jpg", "virtual"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "I ristoranti che soddisfano la tua voglia di novità e originalità.",
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
                                                        "poke_housefusion_salutare.jpg",
                                                        "virtual"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  name: "Poke House",
                                                  categoria: "Fushion",
                                                  rate: '4.2',
                                                ),
                                                onTap: () {
                                                  Get.toNamed(('/idividualItem.dart'),
                                                      arguments: '${ristorante.id}');
                                                },
                                              )
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
