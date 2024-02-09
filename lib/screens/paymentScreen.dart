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


class PaymentScreen extends StatefulWidget{
  static const routeName = "/paymentScreen";

  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}
  class _PaymentScreenState extends State<PaymentScreen> {
    TextEditingController _cardnumber = TextEditingController();
  TextEditingController _MM = TextEditingController();
  TextEditingController  _securitycode = TextEditingController();
    TextEditingController  _firstname = TextEditingController();
    TextEditingController  _lastname = TextEditingController();
    TextEditingController  _yy = TextEditingController();

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
  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0),
  child: Row(
  children: [
  Text(
  "Customize your payment method",
  style: Helper.getTheme(context).headline5,
  )
  ],
  ),
  ),

  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0),
  child: Divider(
  color: AppColors.Grigio,
  thickness: 1.5,
  height: 30,
  ),
  ),

  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0),
  child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  Text(
  "Cash/Card on delivery",
  style: TextStyle(
  color: AppColors.Bianco,
  fontWeight: FontWeight.bold),
  ), Icon(
  Icons.check,
  color: AppColors.Orange,
  ),
  ]

  ),

  ),

  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0),
  child: Divider(
  color: AppColors.Grigio,
  thickness: 1.5,
  height: 30,
  ),
  ),

  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0),
  child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  SizedBox(
  height: 40,
  child: Image.asset(
  Helper.getAssetName("visa.png", "virtual"),
  ),
  ),
  Text("**** ****"),
  Text("2187"),
  OutlinedButton(
  style: ButtonStyle(
  side: MaterialStateProperty.all(
  BorderSide(
  color: AppColors.Orange,
  ),
  ),
  shape: MaterialStateProperty.all(
  StadiumBorder(),
  ),
  foregroundColor: MaterialStateProperty.all(
  AppColors.Orange)),
  onPressed: () {},
  child: Text("Delete Card"),
  )
  ],
  ),),

  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0),
  child: Divider(
  color: AppColors.Grigio,
  thickness: 1.5,
  height: 30,
  ),
  ),

  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0),
  child:Row(
  children: [
  Text(
  "Other Methods",
  style: TextStyle(
  color: AppColors.Bianco,
  fontWeight: FontWeight.bold),
  )
  ],
  ),
  ),

  SizedBox(
  height: 50,
  ),
  Container(
  padding: const EdgeInsets.symmetric(horizontal: 20.0),
  height: 50,
  child: ElevatedButton(
  onPressed: () {
  showModalBottomSheet(
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(20),
  ),
  isScrollControlled: true,
  isDismissible: false,
  context: context,
  builder: (context) {
  return Container(
    color: AppColors.Text,
  height: Helper.getScreenHeight(context) * 0.7,
  child: Column(
  children: [
  Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
  IconButton(
  onPressed: () {
  Navigator.of(context).pop();
  },
  icon: Icon(
  Icons.clear, color: AppColors.Bianco,
  ),
  )
  ],
  ),
  Padding(
  padding: const EdgeInsets.symmetric(
  horizontal: 20.0),
  child: Row(
  children: [
  Text(
  "Add Credit/Debit Card",

  style: Helper.getTheme(context)
      .headline5,

  )
  ],
  ),
  ),
  Padding(
  padding: const EdgeInsets.symmetric(
  horizontal: 20.0),
  child: Divider(
  color: AppColors.Grigio,
  thickness: 1.5,
  height: 40,
  ),
  ),
  Padding(
  padding: const EdgeInsets.symmetric(
  horizontal: 20.0),
      child: CustomTextInput(
          hintText: "card Number",
        controller: _cardnumber),
  ),
  SizedBox(
  height: 20,
  ),
  Padding(
  padding: const EdgeInsets.symmetric(
  horizontal: 30.0),
  child: Row(
  mainAxisAlignment:
  MainAxisAlignment.spaceBetween,
  children: [
  Text("Expiry",  style: Helper.getTheme(context).headline5,),
  SizedBox(
  height: 50,
  width: 100,
  child: CustomTextInput(
  hintText: "MM", controller: _MM,
  ),
  ),
  SizedBox(
  height: 50,
  width: 100,
  child: CustomTextInput(
  hintText: "YY", controller: _yy,
  ),
  )
  ],
  ),
  ),
  SizedBox(
  height: 20,
  ),
    Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20.0),
      child: CustomTextInput(
          hintText: "Security Code", controller: _securitycode),
    ),
    SizedBox(
      height: 20,
    ),
    Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20.0),
      child: CustomTextInput(
          hintText: "First Name",
      controller: _firstname,),
    ),
    SizedBox(
      height: 20,
    ),
    Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20.0),
      child: CustomTextInput(
          hintText: "Last Name",
      controller: _lastname,),
    ),
    SizedBox(
      height: 20,
    ),
  Padding(
  padding: const EdgeInsets.symmetric(
  horizontal: 20.0),
  child: Row(
  mainAxisAlignment:
  MainAxisAlignment.spaceBetween,
  children: [
  Text("You can remove this card"),
  Switch(
  value: false,
  onChanged: (_) {},
  thumbColor:
  MaterialStateProperty.all(
AppColors.Rosso  ),
  )
  ],
  ),
  ),
  SizedBox(
  height: 30,
  ),
  Padding(
  padding: const EdgeInsets.symmetric(
  horizontal: 20.0),
  child: SizedBox(
  height: 50,
  child: ElevatedButton(
  onPressed: () {
  Navigator.of(context).pop();
  },
  child: Row(
  mainAxisAlignment:
  MainAxisAlignment.center,
  children: [
  Icon(
  Icons.add, color: AppColors.Bianco,
  ),
  SizedBox(width: 10),
  Text("Add Card",  style: Helper.getTheme(context).headline5),
  SizedBox(width: 40),
  ],
  )),
  ),
  )
  ],
  ),
  );
  });
  },
  child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Icon(Icons.add, color: AppColors.Bianco),
  Text("Add Another Credit/Debit Card",  style: Helper.getTheme(context).headline5,),
  ],
  )),
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
