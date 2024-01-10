import 'package:flutter/material.dart';
import 'package:vogliadifood_app/utils/colors.dart';
import 'package:vogliadifood_app/utils/helper.dart';

//7:44

class CustomNavbar extends StatefulWidget {
  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: Helper.getScreenWidth(context),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 70,
          width: Helper.getScreenWidth(context),
          padding: const EdgeInsets.symmetric(horizontal: 80),
          color: AppColors.Bianco,
          child:
           Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Helper.getAssetName("categorie.png", "virtual"),),
              // Text("Categorie",
              //   style: Helper.getTheme(context).headline1,),
            ],
          ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Helper.getAssetName("home_filled.png", "virtual"),),
              //   Text("Home",
              //     style: Helper.getTheme(context).headline1,),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Helper.getAssetName("profilo.png", "virtual"),),
                // Text("Profilo",
                //   style: Helper.getTheme(context).headline1,),
              ],
            ),
           ],
          ),
        ),
      ),
    );
  }
}
