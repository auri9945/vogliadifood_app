import 'package:flutter/material.dart';
import 'package:vogliadifood_app/screens/CategorieScreen.dart';
import 'package:vogliadifood_app/widget/searchbar.dart';
import '../utils/colors.dart';
import '../widget/CustomNavbar.dart';
import '../utils/helper.dart';
import '../widget/categorieVoglia.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/homeScreen";

  const HomeScreen({super.key});

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
                    fit: BoxFit.fill,
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
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
                              "Benvenuto Marino!",
                              style: Helper.getTheme(context).displaySmall,
                            ),
                            Image.asset(
                              Helper.getAssetName(
                                  "shopping_cart.png", "virtual"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text("Via Roma, 23 - Torino"),
                      ),
                      // SizedBox(
                      //   height: 21,
                      // ),
                      // Container(
                      //   margin: const EdgeInsets.only(left: 20.0),
                      //   padding: const EdgeInsets.symmetric(
                      //     horizontal: 20,
                      //   ),
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(10)),
                      //   child: DropdownButtonHideUnderline(
                      //     child: SizedBox(
                      //       width: 250,
                      //       child: DropdownButton(
                      //         value: "current location",
                      //         items: [
                      //           DropdownMenuItem(
                      //             child: Text("Current location"),
                      //             value: "current location",
                      //           ),
                      //         ],
                      //         icon: Image.asset(
                      //           Helper.getAssetName("dropdown.png", "virtual"),
                      //         ),
                      //         style: Helper.getTheme(context).headline4,
                      //         onChanged: (value) {},
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 30,
                      ),
                      const SearchBarBox(),
                      const SizedBox(
                        height: 20,
                      ),




                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "In questo momento ho voglia dì...",
                              style:
                              Helper.getTheme(context).headlineSmall
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed(CategorieScreen.routeName);
                              },
                              child: const Text("View All"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 150,
                        padding: const EdgeInsets.only(left: 20),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(

                            children: [
                              CategiarieVoglia(
                                image: Image.asset(
                                  Helper.getAssetName(
                                      "cheeseburger-gourmet-alla-griglia-su-tavolo-in-legno-rustico-generato-da-ai.jpg",
                                      "virtual"),
                                  fit: BoxFit.cover,
                                ),
                                name: "Schifezze",
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CategiarieVoglia(
                                image: Image.asset(
                                  Helper.getAssetName(
                                      "rotolo-di-maki-con-cetriolo-servito-con-salsa-e-semi-di-sesamo.jpg",
                                      "virtual"),
                                  fit: BoxFit.cover,
                                ),
                                name: "Mondo",
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CategiarieVoglia(
                                image: Image.asset(
                                  Helper.getAssetName("salutare.png", "virtual"),
                                  fit: BoxFit.cover,
                                ),
                                name: "Salutare",
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CategiarieVoglia(
                                image: Image.asset(
                                  Helper.getAssetName("casa.png", "virtual"),
                                  fit: BoxFit.cover,
                                ),
                                name: "Casa",
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "Ristoranti popolari",
                                style:
                                Helper.getTheme(context).headline6,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      RistorantiPopolari(
                        image: Image.asset(
                          Helper.getAssetName(
                              "spaghettipomodorini.jpg", "virtual"),
                          fit: BoxFit.cover,
                        ),
                        name: "la Cucaracia",
                        categoria: "Pasta",
                        rate: '4.5',
                      ),
                      RistorantiPopolari(
                        image: Image.asset(
                        Helper.getAssetName(
                            "zucca.jpeg", "virtual"),
                        fit: BoxFit.cover,
                      ),
                        name: "la Zuppa",
                        categoria: "Salutare",
                        rate: '4',
                      ),
                      RistorantiPopolari(
                        image: Image.asset(
                          Helper.getAssetName(
                              "bowl.jpg", "virtual"),
                          fit: BoxFit.cover,
                        ),
                        name: "Bowl King",
                        categoria: "Salutare",
                        rate: '3.8',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      const Positioned(
          bottom:0,
          left:0,
          child: CustomNavbar(
        home: true,
      )),
    ],
   )
  );
 }
}

class RistorantiPopolari extends StatelessWidget {
  const RistorantiPopolari({
    Key? key,
    required Image image,
    required String name,
    required String rate,
    required String categoria,
  }) :  _image = image,
        _name = name,
        _rate = rate,
        _categoria = categoria,
        super(key: key);

  final String _name;
  final String _rate;
  final String _categoria;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: _image
          ),
          const SizedBox(height: 10,),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                     _name,
                      style:
                          Helper.getTheme(context).titleLarge,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Image.asset(
                      Helper.getAssetName(
                          "star_filled.png", "virtual"),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      _rate,
                      style: const TextStyle(
                        color: AppColors.Orange,
                      ),
                    ),

                    const SizedBox(width: 10,),
                    const Padding(
                        padding: EdgeInsets.only(bottom: 5.0,),
                      child: Text(
                          ".",
                      style: TextStyle(
                        color: AppColors.Rosso,
                        fontWeight: FontWeight.w900,
                      ),
                      ),
                    ),
                    const SizedBox(width: 10,),

                    Text(_categoria),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

