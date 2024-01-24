import 'dart:convert';
import 'package:vogliadifood_app/model/piatti.dart';
import 'package:vogliadifood_app/model/piatti_api.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

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

  @override
  Widget build(BuildContext context) {
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed(
                                      CategorieScreen.routeName);
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios_rounded,
                                  color: AppColors.Bianco,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Nome Ristorante",
                                  style: Helper.getTheme(context).titleLarge,
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
                          style: Helper.getTheme(context).displaySmall,
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      FutureBuilder<List<Piatti>>(
                          future: fetchPiatti(),
                          builder: (context, snapshot){
                            if(snapshot.hasData){
                              return ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, int index) {
                                    Piatti piatto = snapshot.data![index];
                                    return Text('${piatto.piatto}',);
                                  },

                              );
                            }
                            return CircularProgressIndicator();
                          }
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child:
                        Text("Bevande",
                          style: Helper.getTheme(context).titleLarge,
                        ),
                      ),

                    ],
                  ),
                ),
                  ],
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







//   Future ElencoDeiPiatti() async {
//     var regAPIUrl = "http://localhost/AndroidProgetto/Vogliadifood/ElencaPiatti.php";
//
//
//     http.Response response = await http.post(Uri.parse(regAPIUrl));
//
//     var data = jsonDecode(response as String);
//
//     function(response){
//       response.forEach((item)=>{
//       Fluttertoast.showToast(
//       msg: item.piatto,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.CENTER,
//       timeInSecForIosWeb: 2,
//       backgroundColor: Colors.red,
//       textColor: Colors.white,
//       fontSize: 16.0
//       ),
//       });
//     }
//   }
//
}


