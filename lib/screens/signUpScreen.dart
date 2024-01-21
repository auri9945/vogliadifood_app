import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vogliadifood_app/screens/introScreen.dart';
import 'package:vogliadifood_app/screens/loginScreen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import '../utils/colors.dart';
import '../utils/helper.dart';


void main() {
  runApp(SignUpScreen());
}
class SignUpScreen extends StatefulWidget {
 static const routeName = "/signUpScreen";
  SignUpScreen({Key?key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController indirizzo = TextEditingController();
  TextEditingController password = TextEditingController();

Future<void>insertrecord() async

{

  if(email.text != ""|| indirizzo.text != ""|| password.text != "") {
    try {
      String uri = "http://10.0.2.2/vogliadifood/insert_record.php";
      var res = await http.post(Uri.parse(uri), body: {
        "email": email.text,
        "indirizzo": indirizzo.text,
        "password": password.text
      });

      var response = jsonDecode(res.body);
      if (response["success"] == "true") {
        print("registrazione inserita");

     //   email.text ="";
       // indirizzo.text ="";
      //  password.text ="";

      }else{ print("Ops qualcosa non è andato a buon fine");
            
      }
    }   catch(e){
      print(e);
    }
  }
  else {
    print("Si prega di compilare tutti i campi");
  }

}



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


            Container(
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
                      style: Helper.getTheme(context).headline5

                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    margin: EdgeInsets.all (10),
                    child: TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                            label: Text('Inserisci la tua email',
                                style: Helper.getTheme(context).headline5)),
                        )
                    ),

                  Container(
                      margin: EdgeInsets.all (10),
                      child: TextFormField(
                        controller: indirizzo,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Inserisci il tuo indirizzo',
                                style: Helper.getTheme(context).headline5)),
                      )
                  ),
              Container(
                  margin: EdgeInsets.all (10),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Crea la tua password',
                            style: Helper.getTheme(context).headline5)),
                  )
              ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child:
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.Rosso),
                        foregroundColor: MaterialStateProperty.all(AppColors.Bianco),
                      ),


                      onPressed: (){
                        insertrecord();
                        Navigator.of(context)
                            .pushReplacementNamed(IntroScreen.routeName);
                      },
                      child: Text("Registrati"),
                    ),
                  ),),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routeName);
                      },

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Hai già un account?",
                              style: Helper.getTheme(context).headline5),
                          SizedBox(width: 10,),
                          Text("Login",
                            style: TextStyle(color: AppColors.Orange, fontWeight: FontWeight.bold),),
                        ],
                      ),
                  )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }}

