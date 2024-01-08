import 'package:flutter/material.dart';
import 'package:vogliadifood_app/utils/colors.dart';
import '../utils/helper.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/homeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: Helper.getScreenHeight(context),
            width: Helper.getScreenWidth(context),
            child: Stack(
              children: [
              Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                Helper.getAssetName("Sfondo_app2.png", "virtual"),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Benvenuto Marino!",
                      style: Helper
                          .getTheme(context)
                          .headline3,
                    ),
                    Image.asset(
                      Helper.getAssetName(
                          "shopping_cart.png", "virtual"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text("Via Roma, 23 - Torino"),
              ),
              // SizedBox(
              //   height: 21,
              // ),
              // Container(
              //   margin: const EdgeInsets.only(left: 20.0),
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: 20,
              //   ),
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(10)),
              //   child: DropdownButtonHideUnderline(
              //     child: SizedBox(
              //       width: 250,
              //       child: DropdownButton(
              //         value: "current location",
              //         items: [
              //           DropdownMenuItem(
              //             child: Text("Current location"),
              //             value: "current location",
              //           ),
              //         ],
              //         icon: Image.asset(
              //           Helper.getAssetName("dropdown.png", "virtual"),
              //         ),
              //         style: Helper.getTheme(context).headline4,
              //         onChanged: (value) {},
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 30,
              ),
              Padding(
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
                      border: InputBorder.none, prefixIcon:
                    Image.asset(
                      Helper.getAssetName("search_filled.png", "virtual"),),
                      hintText: "Ho voglia dì..",
                      hintStyle: TextStyle(
                        color: AppColors.Grigio,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("In questo momento ho voglia dì.."),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 150,
                padding: const EdgeInsets.only(left: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategiarieVoglia(image:
                      Image.asset(Helper.getAssetName(
                          "cheeseburger-gourmet-alla-griglia-su-tavolo-in-legno-rustico-generato-da-ai.jpg",
                          "virtual"),
                        fit:  BoxFit.cover,
                      ),
                        name: "Fast Food",
                      ),
                      SizedBox(width: 10,),
                      CategiarieVoglia(image:
                      Image.asset(Helper.getAssetName(
                          "rotolo-di-maki-con-cetriolo-servito-con-salsa-e-semi-di-sesamo.jpg",
                          "virtual"),
                        fit:  BoxFit.cover,
                      ),
                        name: "Sushi",
                      ),
                      SizedBox(width: 10,),

                      CategiarieVoglia(image:
                      Image.asset(Helper.getAssetName(
                          "Kebab.jpg",
                          "virtual"),
                        fit:  BoxFit.cover,
                      ),
                        name: "Kebab",
                      ),

                      SizedBox(width: 10,),

                      CategiarieVoglia(image:
                      Image.asset(Helper.getAssetName(
                          "fetta-di-cheesecake-al-cioccolato-dolce-su-piatto-di-stoviglie-nere-ai-generativo.jpg",
                          "virtual"),
                        fit:  BoxFit.cover,
                      ),
                        name: "Dolce",
                      ),
                      SizedBox(width: 10,),


                    ],
                  ),
                ),
              ),
              ],
            ),
          )
          ],
        ),
      ),
    ),)
    ,
    );
  }
}

class CategiarieVoglia extends StatelessWidget {
  const CategiarieVoglia({
    Key? key,
    required Image image,
    required String name,
  })
      : _image = image,
        _name = name,
        super(key: key);

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
              width: 110,
              height: 110,
              child: _image
          ),
        ),
        SizedBox(height: 10,),
        Text(_name,
            style: Helper
                .getTheme(context)
                .headline2
                ?.copyWith(color: AppColors.Bianco)),
      ],
    );
  }
}
