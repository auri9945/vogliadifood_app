import 'package:flutter/material.dart';

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
            Container(
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
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        foregroundColor: MaterialStateProperty.all(AppColors.Bianco),
                        shape: MaterialStateProperty.all(
                          StadiumBorder(
                            side:
                            BorderSide(color: AppColors.Bianco, width: 1),
                          ),
                        ),
                      ),
                      onPressed: (){},
                      child: Text("Login"),
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
