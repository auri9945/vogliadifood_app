import 'package:flutter/material.dart';
import 'package:vogliadifood_app/widget/CustomNavbar.dart';

class CategorieScreen extends StatelessWidget {
  static const routeName = "/categorieScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left:0,
            child: CustomNavbar(
                categorie: true,
              ),
          ),

        ],
      ),
    );
  }
}
