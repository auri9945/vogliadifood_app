import 'package:flutter/material.dart';
import 'package:vogliadifood_app/utils/colors.dart';
import 'package:vogliadifood_app/widget/CustomNavbar.dart';
import '../utils/helper.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/homeScreen";

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
                    fit: BoxFit.fill,
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              "Benvenuto Marino!",
                              style: Helper.getTheme(context).headline3,
                            ),
                            Image.asset(
                              Helper.getAssetName(
                                  "shopping_cart.png", "virtual"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
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
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: ShapeDecoration(
                            shape: StadiumBorder(),
                            color: AppColors.Bianco,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Image.asset(
                                Helper.getAssetName(
                                    "search_filled.png", "virtual"),
                              ),
                              hintText: "Ho voglia dì..",
                              hintStyle: TextStyle(
                                color: AppColors.Grigio,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "In questo momento ho voglia dì..",
                          style: Helper.getTheme(context).headline5,
                        ),
                      ),
                      SizedBox(
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
                                name: "Fast Food",
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CategiarieVoglia(
                                image: Image.asset(
                                  Helper.getAssetName(
                                      "rotolo-di-maki-con-cetriolo-servito-con-salsa-e-semi-di-sesamo.jpg",
                                      "virtual"),
                                  fit: BoxFit.cover,
                                ),
                                name: "Sushi",
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CategiarieVoglia(
                                image: Image.asset(
                                  Helper.getAssetName("Kebab.jpg", "virtual"),
                                  fit: BoxFit.cover,
                                ),
                                name: "Kebab",
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CategiarieVoglia(
                                image: Image.asset(
                                  Helper.getAssetName("pizza.jpg", "virtual"),
                                  fit: BoxFit.cover,
                                ),
                                name: "Pizza",
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CategiarieVoglia(
                                image: Image.asset(
                                  Helper.getAssetName(
                                      "fetta-di-cheesecake-al-cioccolato-dolce-su-piatto-di-stoviglie-nere-ai-generativo.jpg",
                                      "virtual"),
                                  fit: BoxFit.cover,
                                ),
                                name: "Dolce",
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CategiarieVoglia(
                                image: Image.asset(
                                  Helper.getAssetName(
                                      "spaghetticozze.jpeg", "virtual"),
                                  fit: BoxFit.cover,
                                ),
                                name: "Pasta",
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
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
                                  Helper.getTheme(context).headline3?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text("View All"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
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
                        categoria2: "italiana",
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
                        categoria2: "Vegana",
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
                        categoria2: "Orientale",
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
      Positioned(bottom:0, left:0, child: CustomNavbar()),
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
    required String categoria2,
  }) :  _image = image,
        _name = name,
        _rate = rate,
        _categoria = categoria,
        _categoria2 = categoria2,
        super(key: key);

  final String _name;
  final String _rate;
  final String _categoria;
  final String _categoria2;
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
          SizedBox(height: 10,),
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
                          Helper.getTheme(context).headline6,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
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
                    SizedBox(width: 10,),

                    Text(_categoria),
                    SizedBox(width: 5,),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 5.0,),
                      child: Text(
                          ".",
                      style: TextStyle(
                        color: AppColors.Rosso,
                        fontWeight: FontWeight.w900,
                      ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text(_categoria2),
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

class CategiarieVoglia extends StatelessWidget {
  const CategiarieVoglia({
    Key? key,
    required Image image,
    required String name,
  })  : _image = image,
        _name = name,
        super(key: key);

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(width: 110, height: 110, child: _image),
        ),
        SizedBox(
          height: 10,
        ),
        Text(_name,
            style: Helper.getTheme(context)
                .headline2
                ?.copyWith(color: AppColors.Bianco)),
      ],
    );
  }
}
