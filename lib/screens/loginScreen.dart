import 'package:flutter/material.dart';
import 'package:vogliadifood_app/utils/colors.dart';
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
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),

            child: Column(
              children: [
                Text(
                  "Login",
                  style: Helper.getTheme(context).headline6,
                ),

                SizedBox(
                    height: 10,
                ),

                Text("Inserisci i tuoi dati per accedere",
                    style: Helper.getTheme(context).headline5
                ),
                SizedBox(
                    height: 10,
                ),
                CustomTextInput(
                    hintText: "La tua email",
                ),
                SizedBox(
                    height: 10,
                ),
                CustomTextInput(
                  hintText: "Password",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    String hintText,
  required Key key,
}) : _hintText = hintText,super(key: key);

  final String _hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: ShapeDecoration(
        color: AppColors.Orange,
        shape: StadiumBorder(),
      ),

      child: TextField(
        decoration: InputDecoration(
        border: InputBorder.none,
          hintText: _hintText,
          hintStyle: TextStyle(
              color: AppColors.Orange,
    ),
      contentPadding: const EdgeInsets.only(left: 40),
    ),
    ),
    );
  }
}