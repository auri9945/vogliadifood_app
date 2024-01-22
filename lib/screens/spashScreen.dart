import 'package:flutter/material.dart';
import 'package:vogliadifood_app/screens/signUpScreen.dart';
import 'package:vogliadifood_app/utils/colors.dart';
import 'package:vogliadifood_app/utils/helper.dart';

import 'loginScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                Helper.getAssetName("sfondo_destination_home.png", "virtual"),
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset("assets/image/icona_rossa_elisse.png"),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: Helper.getScreenHeight(context) * 0.3,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      const Flexible(
                        child: Text(
                          "Voglia di l'app del food che c'è sempre per te. Accedi o regitrati per soddisfare le tue Vogliedì..",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(LoginScreen.routeName);
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.Bianco, // Text Color
                          ),
                          child: const Text("Login"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            foregroundColor:
                                MaterialStateProperty.all(AppColors.Bianco),
                            shape: MaterialStateProperty.all(
                              const StadiumBorder(
                                side: BorderSide(
                                    color: AppColors.Bianco, width: 1.5),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(SignUpScreen.routeName);
                          },
                          child: const Text("Crea il tuo account"),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
