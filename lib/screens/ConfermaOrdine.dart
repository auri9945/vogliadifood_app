import 'package:flutter/material.dart';
import 'package:vogliadifood_app/screens/homeScreen.dart';

import '../utils/colors.dart';
import '../utils/helper.dart';

class ConfermaScreen extends StatelessWidget {
  static const routeName = "/confermaOrdine";

  String calculateDeliveryTime() {
    // Ottieni l'ora attuale
    DateTime now = DateTime.now();

    // Calcola l'ora di consegna aggiungendo 1 ora all'ora attuale
    DateTime deliveryTime = now.add(Duration(minutes: 30));

    // Formatta il tempo di consegna come stringa
    String formattedDeliveryTime =
        "${deliveryTime.hour}:${deliveryTime.minute}:${deliveryTime.second}";

    return formattedDeliveryTime;
  }

  const ConfermaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String deliveryTime = calculateDeliveryTime();
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
                      height: 150,
                    ),
                    Image.asset(
                      Helper.getAssetName("icona_rossa_elisse.png", "virtual"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Ordine Confermato",
                          style: Helper.getTheme(context).headline3,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Siamo contenti che tu abbia scelto noi per soddisfare le tue voglie!",
                          style: Helper.getTheme(context).headline5,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Text(
                            "il tuo ordine arriverà all'ora:",
                            style: Helper.getTheme(context).headline5,
                          ),
                        ),
                        Container(
                          child: Text(
                            '$deliveryTime',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 200,
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
                            child: const Text("Torna alla Home page "),
                          ),
                        ),
                      ],
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
