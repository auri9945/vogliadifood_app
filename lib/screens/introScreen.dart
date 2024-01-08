import 'package:flutter/material.dart';
import 'package:vogliadifood_app/screens/homeScreen.dart';

import '../utils/colors.dart';
import '../utils/helper.dart';

class IntroScreen extends StatelessWidget {
  static const routeName = "/introScreen";


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
                Helper.getAssetName("sfondo_intro.png", "virtual"),
                fit: BoxFit.fill,
              ),
            ),

            Align(

              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 500,
                    ),
                    Text(
                      "Inizia ora a soddisfare le tue Vogliedì...",
                      style: Helper.getTheme(context).headline5,
                    ),
                    SizedBox(height: 30,),

                    SizedBox(
                      width: 150,
                      height: 50,
                      child:
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(AppColors.Rosso),
                          foregroundColor: MaterialStateProperty.all(AppColors.Bianco),
                        ),
                        onPressed: (){
                          Navigator.of(context)
                              .pushReplacementNamed(HomeScreen.routeName);
                        },
                        child: Text("Prosegui >>"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
