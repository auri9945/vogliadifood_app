import 'package:flutter/material.dart';
import 'package:vogliadifood_app/widget/CustomNavbar.dart';

import '../utils/helper.dart';
import 'loginScreen.dart';

class ProfiloScreen extends StatelessWidget {
  static const routeName = "/profiloScreen";

  const ProfiloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: SizedBox(
                height: Helper.getScreenHeight(context),
                width: Helper.getScreenWidth(context),
                child: Stack(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.asset(
                          Helper.getAssetName("Sfondo_app2.png", "virtual"),
                          fit: BoxFit.cover,
                        ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 30),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Profilo",
                                      style: Helper.getTheme(context).titleLarge,
                                    ),
                                  ),
                                  Image.asset(
                                    Helper.getAssetName(
                                        "shopping_cart.png", "virtual"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            child: Text("Ciao Marino!",
                              style: Helper.getTheme(context).displaySmall,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const CustomTextInput(
                            hintText: 'nome',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomTextInput(
                            hintText: 'Cognome',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomTextInput(
                            hintText: 'Email',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomTextInput(
                            hintText: 'Indirizzo',
                          ),

                          const SizedBox(
                            height: 30,
                          ),

                          SizedBox(
                            height: 50,
                            width: 200,
                            child: ElevatedButton(
                              style: const ButtonStyle(

                              ),
                              onPressed: (){},
                              child:
                              Text("Aggiorna profilo",
                              style: Helper.getTheme(context).headlineSmall,),
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          Text("or",
                            style: Helper.getTheme(context).headlineSmall,
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          SizedBox(
                            height: 50,
                            width: 200,
                            child: ElevatedButton(
                              onPressed: (){},
                              child:
                              Text("Logout",
                                style: Helper.getTheme(context).headlineSmall,),
                            ),
                          ),





                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ),
          const Positioned(
            bottom: 0,
              left: 0,
              child: CustomNavbar(
                profilo: true,
              ),
          ),
        ],
      ),
    );
  }
}
