import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vogliadifood_app/controller/carello_controller.dart';
import 'package:vogliadifood_app/model/bevande.dart';
import 'package:vogliadifood_app/model/bevande_api.dart';
import 'package:vogliadifood_app/model/piatti_api.dart';
import '../model/piatti.dart';
import '../utils/colors.dart';

class CarrelloProdotti extends StatelessWidget {
  final CarelloController controller = Get.find();

  CarrelloProdotti({Key? key, required this.arguments}) : super(key: key);

  final dynamic arguments;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.selectedProducts.isNotEmpty
          ? FutureBuilder(
              future: Future.wait([fetchPiatti(arguments), fetchBevande()]),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text(
                      'Errore durante il recupero dei dati: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  List<Piatti> piatti = snapshot.data![0];
                  List<Bevande> bevande = snapshot.data![1];
                  if (piatti.isNotEmpty) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, index) {
                        Piatti product = snapshot.data![index];
                        ;
                        return CarrelloPiattiItem(
                          controller: controller,
                          product: product,
                          index: index,
                        );
                      },
                    );
                  } else if (bevande.isNotEmpty) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, index) {
                        Bevande product = snapshot.data![index];
                        return CarrelloBevandeiItem(
                          controller: controller,
                          product: product,
                          index: index,
                        );
                      },
                    );
                  }
                } else {
                  return Text('Nessun dato disponibile');
                }
                return SizedBox();
                },
            )
          : const SizedBox(
              height: 800,
              child: Center(child: Text("carrello vuoto")),
            ),
    );
  }
}

class CarrelloPiattiItem extends StatelessWidget {
  final CarelloController controller;
  final Piatti product;
  final int index;

  CarrelloPiattiItem(
      {Key? key,
        required this.index,
     required this.controller,
      required this.product})
      :  super(key: key) {

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '${product.piatto}',
              style: TextStyle(
                fontSize: 20,
                color: AppColors.Bianco,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: Text(
              "${product.prezzo} €",
              style: TextStyle(
                fontSize: 15,
                color: AppColors.Orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          IconButton(
            onPressed: () {
             controller.selectedProducts.add(product);
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              controller.selectedProducts.remove(product);
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}

class CarrelloBevandeiItem extends StatelessWidget {
  final CarelloController controller;
  final Bevande product;
  final int index;

  CarrelloBevandeiItem(
      {Key? key,
      required this.index,
      required this.controller,
      required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '${product.bevanda}',
              style: TextStyle(
                fontSize: 20,
                color: AppColors.Bianco,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: Text(
              '${product.prezzo}€',
              style: TextStyle(
                fontSize: 15,
                color: AppColors.Orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          IconButton(
            onPressed: () {
              controller.selectedBevande.add(product);
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              controller.selectedBevande.remove(product);
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}


