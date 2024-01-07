import 'package:flutter/material.dart';
import 'package:vogliadifood_app/screens/introScreen.dart';
import 'package:vogliadifood_app/screens/loginScreen.dart';

import '../utils/colors.dart';
import '../utils/helper.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = "/signUpScreen";

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
                    height: 40,
                  ),

                  CustomTextInput(
                    hintText: "nome e cognome",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextInput(
                    hintText: "Indirizzo",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextInput(
                    hintText: "La tua email",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextInput(
                    hintText: "password",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextInput(
                    hintText: "Conferma password",
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child:
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.Rosso),
                        foregroundColor: MaterialStateProperty.all(AppColors.Bianco),
                      ),
                      onPressed: (){
                        Navigator.of(context)
                            .pushReplacementNamed(IntroScreen.routeName);
                      },
                      child: Text("Registrati"),
                    ),
                  ),

                  SizedBox(height: 30,),
                  GestureDetector(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    required String hintText,
    Key? key,
  }) : _hintText = hintText, super (key: key) ;

  final String _hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: ShapeDecoration(
        color: AppColors.Bianco,
        shape: StadiumBorder(),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: _hintText,
          hintStyle: TextStyle(
            color: AppColors.Text,
          ),
          contentPadding: const EdgeInsets.only(left: 40),
        ),
      ),
    );
  }
}