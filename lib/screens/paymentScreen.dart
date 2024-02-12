import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:vogliadifood_app/screens/introScreen.dart';
import 'package:vogliadifood_app/screens/signUpScreen.dart';
import 'package:vogliadifood_app/utils/colors.dart';
import 'package:vogliadifood_app/utils/helper.dart';

import '../widget/CustomNavbar.dart';
import '../widget/customTextInput.dart';
import 'homeScreen.dart';
import 'package:http/http.dart' as http;

class PaymentScreen extends StatefulWidget {
  static const routeName = "/paymentScreen";

  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController _cardnumber = TextEditingController();
  TextEditingController _MM = TextEditingController();
  TextEditingController _securitycode = TextEditingController();
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _yy = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _indirizzo = TextEditingController();


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
                                      "Torna indietro",
                                      style:
                                          Helper.getTheme(context).titleLarge,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Compila i campi",
                                          style: Helper.getTheme(context).headline5,
                                        )
                                      ],
                                    ),
                                  ), SizedBox(
                                    height: 20,
                                  ),

                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: CustomTextInput(
                                        hintText: "Nome e cognome",
                                        controller: _name),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: CustomTextInput(
                                        hintText: "Indirizzo",
                                        controller: _indirizzo),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Add Credit/Debit Card",
                                          style: Helper.getTheme(
                                              context)
                                              .headline5,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Divider(
                                      color: AppColors.Grigio,
                                      thickness: 1.5,
                                      height: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: CustomTextInput(
                                        hintText: "card Number",
                                        controller: _cardnumber),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 30.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          "Expiry",
                                          style: Helper.getTheme(
                                              context)
                                              .headline5,
                                        ),
                                        SizedBox(
                                          height: 50,
                                          width: 100,
                                          child: CustomTextInput(
                                            hintText: "MM",
                                            controller: _MM,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 50,
                                          width: 100,
                                          child: CustomTextInput(
                                            hintText: "YY",
                                            controller: _yy,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: CustomTextInput(
                                        hintText: "Security Code",
                                        controller: _securitycode),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: CustomTextInput(
                                      hintText: "First Name",
                                      controller: _firstname,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: CustomTextInput(
                                      hintText: "Last Name",
                                      controller: _lastname,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: SizedBox(
                                      height: 50,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Get.toNamed("/riepilogoFinaleScreen",
                                            arguments: "${_indirizzo}");
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Icon(
                                                Icons.add,
                                                color: AppColors
                                                    .Bianco,
                                              ),
                                              SizedBox(width: 10),
                                              Text("Procedi all'ordine",
                                                  style: Helper
                                                      .getTheme(
                                                      context)
                                                      .headline5),
                                              SizedBox(width: 40),
                                            ],
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
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
            child: CustomNavbar(),
          ),
        ],
      ),
    );
  }
}
