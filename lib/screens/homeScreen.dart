import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get_core/src/get_main.dart';
import 'package:vogliadifood_app/model/ristoranti.dart';
import 'package:vogliadifood_app/model/ristoranti_api.dart';
import 'package:vogliadifood_app/screens/CategorieScreen.dart';
import 'package:vogliadifood_app/screens/casaScreen.dart';
import 'package:vogliadifood_app/screens/mondoScreen.dart';
import 'package:vogliadifood_app/screens/riepilogoScreen.dart';
import 'package:vogliadifood_app/screens/salutareScreen.dart';
import 'package:vogliadifood_app/screens/schifezzeScreen.dart';
import 'package:vogliadifood_app/widget/searchbar.dart';
import '../controller/carello_controller.dart';
import '../utils/colors.dart';
import '../widget/CustomNavbar.dart';
import '../utils/helper.dart';
import '../widget/categorieVoglia.dart';
import 'idividualItem.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/homeScreen";

  const HomeScreen({super.key});

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  var arguments = Get.arguments;
  final controller = Get.put(CarelloController());



  @override
  Widget build(BuildContext context) {

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
                      fit: BoxFit.fill,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          width: 500,
                          height: 250,
                          child: Image.asset(
                            Helper.getAssetName("Voglia.jpg", "virtual"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("In questo momento ho voglia dì...",
                                  style:
                                      Helper.getTheme(context).headlineSmall),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacementNamed(
                                      CategorieScreen.routeName);
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
                                GestureDetector(
                                  onTap: (){
                                    Get.to(SchifezzeScreen());
                                  },
                                  child: CategiarieVoglia(
                                    image: Image.asset(
                                      Helper.getAssetName(
                                          "cheeseburger-gourmet-alla-griglia-su-tavolo-in-legno-rustico-generato-da-ai.jpg",
                                          "virtual"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "Schifezze",
                                  ),
                                ),

                                const SizedBox(
                                  width: 10,
                                ),

                                GestureDetector(
                                  onTap: (){
                                    Get.to(MondoScreen());
                                  },
                                  child:  CategiarieVoglia(
                                    image: Image.asset(
                                      Helper.getAssetName(
                                          "rotolo-di-maki-con-cetriolo-servito-con-salsa-e-semi-di-sesamo.jpg",
                                          "virtual"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "Mondo",
                                  ),
                                ),

                                const SizedBox(
                                  width: 10,
                                ),

                                GestureDetector(
                                  onTap: (){
                                    Get.to(SalutareScreen());
                                  },
                                  child: CategiarieVoglia(
                                    image: Image.asset(
                                      Helper.getAssetName(
                                          "salutare.png", "virtual"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "Salutare",
                                  ),
                                ),

                                const SizedBox(
                                  width: 10,
                                ),

                                GestureDetector(
                                  onTap: (){
                                    Get.to(CasaScreen());
                                  },
                                  child:  CategiarieVoglia(
                                    image: Image.asset(
                                      Helper.getAssetName("casa.png", "virtual"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "Casa",
                                  ),
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
                                style: Helper.getTheme(context).headline6,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            child: FutureBuilder(
                              future: fetchRistoranti(arguments),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    itemCount: snapshot.data?.length,
                                    shrinkWrap: true,
                                    itemBuilder: (BuildContext context, index) {
                                      Ristoranti ristorante =
                                          snapshot.data![index];
                                      return Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            RistorantiPopolari(
                                              image: Image.asset(
                                                Helper.getAssetName(
                                                    "food-delivery.jpg",
                                                    "virtual"),
                                                fit: BoxFit.cover,
                                              ),
                                              name:
                                                  '${ristorante.nomeRistorante}',
                                              time:
                                                  '${ristorante.tempoConsegna}',
                                              categoria:
                                                  '${ristorante.categoriaRistorante}',
                                              rate: '4.5',
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Get.toNamed(('/idividualItem.dart'),
                                                    arguments: '${ristorante.id}');
                                              },
                                              child: Text(
                                                "view more",
                                                style: Helper.getTheme(context)
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
                  )
                ],
              ),
            ),
          ),
        ),
        const Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavbar(
              home: true,
            )),
      ],
    ));
  }
}

class RistorantiPopolari extends StatelessWidget {
  const RistorantiPopolari({
    Key? key,
    required Image image,
    required String name,
    required String time,
    required String rate,
    required String categoria,
  })  : _image = image,
        _name = name,
        _time = time,
        _rate = rate,
        _categoria = categoria,
        super(key: key);

  final String _name;
  final String _time;
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
          SizedBox(height: 200, width: double.infinity, child: _image),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      _name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.Bianco,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
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
                    Text(
                      _time,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.Bianco,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Image.asset(
                      Helper.getAssetName("star_filled.png", "virtual"),
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
                      padding: EdgeInsets.only(
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
                    SizedBox(
                      width: 40,
                    ),
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
