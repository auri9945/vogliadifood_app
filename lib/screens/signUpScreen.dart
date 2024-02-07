import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:vogliadifood_app/screens/introScreen.dart';
import 'package:vogliadifood_app/screens/loginScreen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import '../utils/colors.dart';
import '../utils/helper.dart';
import '../widget/customTextInput.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/signUpScreen";

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _indirizzo = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              // padding: const EdgeInsets.symmetric(
              //   horizontal: 20,
              //   vertical: 30,
              // ),
              child: Image.asset(
                Helper.getAssetName("Sfondo_app.png", "virtual"),
                fit: BoxFit.fill,
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      "Registrati",
                      style: Helper.getTheme(context).headline6,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Inserisci i tuoi dati per creare il tuo account",
                        style: Helper.getTheme(context).headline5),
                    SizedBox(
                      height: 40,
                    ),
                    CustomTextInput(
                      hintText: "La tua email",
                      controller: _email,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextInput(
                      hintText: "il tuo indirizzo",
                      controller: _indirizzo,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextInput(
                      hintText: "inserisci password",
                      controller: _password,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.Rosso),
                          foregroundColor:
                              MaterialStateProperty.all(AppColors.Bianco),
                        ),
                        onPressed: () {
                          Registrazione();

                          //Navigator.of(context).pushReplacementNamed(IntroScreen.routeName);
                        },
                        child: Text("Registrati"),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routeName);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Hai già un account?",
                              style: Helper.getTheme(context).headline5),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Login",
                            style: TextStyle(
                                color: AppColors.Orange,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future Registrazione() async {
    if (_email.text != "" || _indirizzo.text != "" || _password.text != "") {
      try {} catch (e) {
        print(e);
      }
    } else {
      print("please all the files");
    }

    var regAPIUrl =
        "http://localhost/AndroidProgetto/Vogliadifood/registrazione.php";
    // var regAPIUrl = "C:/xampp/htdocs/AndroidProgetto/vogliadifood/registrazione.php";

    Map maped = {
      'email': _email.text,
      'indirizzo': _indirizzo.text,
      'password': _password.text,
    };

    http.Response response = await http.post(Uri.parse(regAPIUrl), body: maped);

    var data = jsonDecode(response.body);

    print("Data: ${data}");
    if (data['success'] == '1') {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    } else {
      Alert(context: context, title: "RFLUTTER ALERT", desc: data['message'])
          .show();
    }
  }
}
