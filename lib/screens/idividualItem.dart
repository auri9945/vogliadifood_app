import 'dart:convert';
import 'package:vogliadifood_app/model/piatti.dart';
import 'package:vogliadifood_app/model/piatti_api.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vogliadifood_app/model/ristoranti_api.dart';

import '../utils/colors.dart';
import '../utils/helper.dart';
import '../widget/CustomNavbar.dart';
import '../widget/rigaProdotti.dart';
import 'CategorieScreen.dart';
import 'package:http/http.dart' as http;





class IndividualItem extends StatefulWidget {
  static const routeName = "/idividualItem.dart";

  const IndividualItem({super.key});

  @override
  _IndividualItem createState() => _IndividualItem();
}
class _IndividualItem extends State<IndividualItem> {
  var arguments = Get.arguments;

  // Map maped = {
  //   'id': var arguments,
  // };


  @override
  Widget build(BuildContext context) {
    print(arguments);
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
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
                                  onPressed: () { Get.back(); },
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
                                      "McDonald's",
                                      style: Helper
                                          .getTheme(context)
                                          .titleLarge,
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
                          child:
                          Text("Menù",
                            style: Helper
                                .getTheme(context)
                                .displaySmall,
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),

                        Padding(
                            padding: const EdgeInsets.all(20.0),
                          child: Container(
                            child: FutureBuilder(
                            future: fetchPiatti(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: snapshot.data?.length,
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, index) {
                                    Piatti product = snapshot.data![index];
                                    return Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('${product.piatto}',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: AppColors.Bianco,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                            Text('${product.ristoranteId}',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: AppColors.Bianco,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                            Text('${product.descrizione}',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: AppColors.Bianco,
                                              ),),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('${product.prezzo}',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: AppColors.Orange,
                                                fontWeight: FontWeight.bold,
                                              ),)
                                          ],
                                        ),
                                        );
                                  },
                                );
                              }
                              return CircularProgressIndicator();
                            },
                          ),),

                        ),



                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child:
                          Text("Bevande",
                            style: Helper
                                .getTheme(context)
                                .titleLarge,
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
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

Future<void> sendData() async {
  var url = Uri.parse('http://localhost/AndroidProgetto/vogliadifood/ElencaPiatti.php');
  var arguments = Get.arguments;
  var response = await http.post(url, body: {
    'id': arguments,
  });

  if (response.statusCode == 200) {
    print('Data sent successfully: ${response.body}');
  } else {
    print('Failed to send data. Status code: ${response.statusCode}');
  }
}
