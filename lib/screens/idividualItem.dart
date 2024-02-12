import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:vogliadifood_app/model/bevande.dart';
import 'package:vogliadifood_app/model/bevande_api.dart';
import 'package:vogliadifood_app/model/piatti.dart';
import 'package:vogliadifood_app/model/piatti_api.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:vogliadifood_app/model/recensioni.dart';
import 'package:vogliadifood_app/model/recensioni_api.dart';
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

  double _rate = 0.0;
  String _recensione = '';


  void _submitReview() async{

    Map<String, dynamic> reviewData = {
      'rate': _rate.toString(),
      'recensione': _recensione,
      'ristorante_id': arguments,

      //print('Rating: $_rate, Comment: $_recensione');
    };


      // Effettua una richiesta POST all'endpoint desiderato
      try {
        var response = await http.post(
          Uri.parse('http://localhost/AndroidProgetto/vogliadifood/insertRecensioni.php'),
          body: reviewData,
        );


        if (response.statusCode == 200) {
          print('Recensione inviata con successo');
          // Puoi gestire la risposta dal server qui se necessario
        } else {
          print('Errore durante l\'invio della recensione: ${response.reasonPhrase}');
          print('Corpo della risposta: ${response.body}');
          // Puoi gestire eventuali errori di invio qui
        }
      } catch (e) {
        print('Errore durante l\'invio della recensione: $e');
        // Puoi gestire altri tipi di errori, ad esempio problemi di connessione
      }

  }


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
                                                '${product.prezzo}€',
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
                                                '${bevande.prezzo}€',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: AppColors.Orange,
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
                            height: 30,
                          ),
                          Padding(
                              padding:  const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text("Lascia la tua recensione"),
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  'Vota da 1 a 5 stelle:',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 10),
                                RatingBar(
                                  onChanged: (rating) {
                                    setState(() {
                                      _rate = rating;
                                    });
                                  },
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Lascia un commento:',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      _recensione = value;
                                    });
                                  },
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Inserisci il tuo commento qui...',
                                    hintStyle:  TextStyle(
                                    color: AppColors.Text,
                                  ),
                                  ),
                                ),
                            SizedBox(height: 20),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  _submitReview();
                                },
                                child: Text('Invia recensione'),
                              ),
                            ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              child: FutureBuilder(
                                future: fetchRecensioni(arguments),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data?.length,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        Recensioni recensione = snapshot.data![index];
                                        return Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'rate: ${recensione.rate}',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: AppColors.Orange,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'Commento: ${recensione.recensione}€',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: AppColors.Bianco,
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


class RatingBar extends StatefulWidget {
  final ValueChanged<double>? onChanged;

  const RatingBar({Key? key, this.onChanged}) : super(key: key);

  @override
  _RatingBarState createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  double _currentRating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.star),
          onPressed: () {
            widget.onChanged?.call(1);
            setState(() {
              _currentRating = 1;
            });
          },
          color: _currentRating >= 1 ? Colors.yellow : Colors.grey,
        ),
        IconButton(
          icon: Icon(Icons.star),
          onPressed: () {
            widget.onChanged?.call(2);
            setState(() {
              _currentRating = 2;
            });
          },
          color: _currentRating >= 2 ? Colors.yellow : Colors.grey,
        ),
        IconButton(
          icon: Icon(Icons.star),
          onPressed: () {
            widget.onChanged?.call(3);
            setState(() {
              _currentRating = 3;
            });
          },
          color: _currentRating >= 3 ? Colors.yellow : Colors.grey,
        ),
        IconButton(
          icon: Icon(Icons.star),
          onPressed: () {
            widget.onChanged?.call(4);
            setState(() {
              _currentRating = 4;
            });
          },
          color: _currentRating >= 4 ? Colors.yellow : Colors.grey,
        ),
        IconButton(
          icon: Icon(Icons.star),
          onPressed: () {
            widget.onChanged?.call(5);
            setState(() {
              _currentRating = 5;
            });
          },
          color: _currentRating >= 5 ? Colors.yellow : Colors.grey,
        ),
      ],
    );
  }
}