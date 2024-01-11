import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/helper.dart';

class SearchBarBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: ShapeDecoration(
          shape: StadiumBorder(),
          color: AppColors.Bianco,
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Image.asset(
              Helper.getAssetName(
                  "search_filled.png", "virtual"),
            ),
            hintText: "Ho voglia dì..",
            hintStyle: TextStyle(
              color: AppColors.Grigio,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
