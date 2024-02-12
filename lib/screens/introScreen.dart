import 'package:flutter/material.dart';
import 'package:vogliadifood_app/screens/homeScreen.dart';

import '../utils/colors.dart';
import '../utils/helper.dart';

class IntroScreen extends StatelessWidget {
  static const routeName = "/introScreen";

  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                Helper.getAssetName("sfondo_app.png", "virtual"),
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
                    const SizedBox(
                      height: 250,
                    ),
                    Image.asset(
                      Helper.getAssetName("icona_rossa_elisse.png", "virtual")
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "BENVENUTO IN VOGLIADì",
                      style: Helper.getTheme(context).headline6,
                    ),
                    Text(
                      "Inizia ora a soddisfare le tue Vogliedì...",
                      style: Helper.getTheme(context).headline5,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.Rosso),
                          foregroundColor:
                              MaterialStateProperty.all(AppColors.Bianco),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(HomeScreen.routeName);
                        },
                        child: const Text("Prosegui >>"),
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
