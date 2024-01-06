import 'package:flutter/material.dart';
import 'package:vogliadifood_app/utils/helper.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/loginScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),


        child: SafeArea(
          child: Column(
              
              children: [Text("Login",
                style: Helper.getTheme(context).headline6,),
              Text("Inserisci i tuoi dati per accedere"),

              ],
          ),
          
        )

      )
    );
  }
}
