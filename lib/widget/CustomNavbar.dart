import 'package:flutter/material.dart';
import '../screens/CategorieScreen.dart';
import '../screens/homeScreen.dart';
import '../screens/profiloScreen.dart';
import '../utils/colors.dart';
import '../utils/helper.dart';

//7:44

class CustomNavbar extends StatelessWidget {
   final bool categorie;
   final bool home;
   final bool profilo;

  const CustomNavbar({super.key, 
    Key? Key,
    this.categorie=false,
    this.home=false,
    this.profilo=false});

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
             GestureDetector(
               onTap: (){
                 if(!categorie) {
                   Navigator.of(context).pushReplacementNamed(CategorieScreen.routeName);
                 }
               },
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   categorie?Image.asset(Helper.getAssetName("categorie_arancione.png", "virtual"),
                   ):
                     Image.asset(Helper.getAssetName("categorie.png", "virtual"),),
                 ],
               ),
             ),
            GestureDetector(
              onTap: (){
                if(!home ) {
                  Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  home?Image.asset(Helper.getAssetName("home_filled.png", "virtual"),):
                  Image.asset(Helper.getAssetName("home.png", "virtual"),),
                ],
              ),
            ),

            GestureDetector(
              onTap: (){
                if(!profilo ) {
                  Navigator.of(context).pushReplacementNamed(ProfiloScreen.routeName);
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  profilo?Image.asset(Helper.getAssetName("profilo_arancione.png", "virtual"),):
                  Image.asset(Helper.getAssetName("profilo.png", "virtual"),),

                ],
              ),
            ),
           ],
          ),
        ),
      ),
    );
  }
}
