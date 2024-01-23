import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vogliadifood_app/screens/introScreen.dart';
import 'package:vogliadifood_app/screens/signUpScreen.dart';
import 'package:vogliadifood_app/utils/colors.dart';
import 'package:vogliadifood_app/utils/helper.dart';

import '../widget/customTextInput.dart';
import 'homeScreen.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';


class LoginScreen extends StatefulWidget {
  static const routeName = "/loginScreen";

  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() =>  _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  // late Box box1;
  //
  // @override
  //   void initState() {
  //   super.initState();
  //   createBox();
  //   getData();
  // }
  //
  // void createBox()async{
  //   box1 = await Hive.openBox("login");
  // }
  //
  // void getData()async{
  //   if(box1.get('email')!= null){
  //     email.text= box1.get('email');
  //   }
  //   if(box1.get('password')!= null){
  //     password.text= box1.get('password');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
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
                    "Login",
                    style: Helper.getTheme(context).titleLarge,
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Text("Inserisci i tuoi dati per accedere",
                      style: Helper.getTheme(context).headlineSmall),

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
                    hintText: "password",
                    controller: _password,
                  ),

                  SizedBox(
                    height: 30,
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
                        Login();

                      },
                      child: const Text("Login"),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(SignUpScreen.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Non hai un account?",
                            style: Helper.getTheme(context).headlineSmall),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Sign up",
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
          ],
        ),
      ),
    );
  }

  Future Login() async {

    if(_email.text != "" ||  _password.text !=""){
      try{}
      catch(e){
        print(e);
      }
    }
    else{
      print("Compila tutti i campi");
    }

    var regAPIUrl = "http://localhost/AndroidProgetto/vogliadifood/login.php";
    // var regAPIUrl = "C:/xampp/htdocs/AndroidProgetto/vogliadifood/registrazione.php";


    Map maped = {
      'email': _email.text,
      'password': _password.text,
    };

    http.Response response = await http.post(Uri.parse(regAPIUrl),body: maped);

    var data = jsonDecode(response.body);

    print("Data: ${data}");

    if(data['success'] == '1'){
      Navigator.of(context).pushReplacementNamed(IntroScreen.routeName);
    }
    else {
      Fluttertoast.showToast(
          msg: data['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }
}

