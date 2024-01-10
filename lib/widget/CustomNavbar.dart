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
      height: 70,
      width: Helper.getScreenWidth(context),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 80,
          width: Helper.getScreenWidth(context),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: AppColors.Bianco,
          child: Column(
          children: [
           Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Helper.getAssetName("search_filled.png", "virtual"),),
              Text("Bacheca"),
            ],
          ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Helper.getAssetName("search_filled.png", "virtual"),),
                Text("Carrello"),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Helper.getAssetName("search_filled.png", "virtual"),),
                Text("Profilo"),
              ],
            ),
           ],
          ),
          ],
         ),
        ),
      ),
    );
  }
}
