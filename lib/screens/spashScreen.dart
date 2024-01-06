import 'package:flutter/material.dart';
import 'package:vogliadifood_app/utils/colors.dart';
import 'package:vogliadifood_app/utils/helper.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: Stack(
          children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
              Helper.getAssetName("sfondo_destination_home.png", "virtual"),
            fit: BoxFit.fill,
          ),
    ),


        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: Helper.getScreenHeight(context) * 0.3,
            padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            Flexible(child: Text(
        "Voglia di l'app del food che c'è sempre per te",
              textAlign: TextAlign.center,

            ),),

Spacer(),
            SizedBox(
 width: double.infinity,
height: 50,
child: ElevatedButton(
 onPressed: (){},
  style: TextButton.styleFrom(
    primary: AppColors.Bianco, // Text Color
  ),
  child: Text("Login"),
),
 ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: (){},
                style: TextButton.styleFrom(
                  primary: AppColors.Bianco, // Text Color
                ),
                child: Text("Crea il tuo account"),
              ),
            )
            //minutaggio 15:56
          ],

        ),
          ))
          ],
        ),
      ),
    );
  }

}