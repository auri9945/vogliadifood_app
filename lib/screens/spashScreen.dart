import 'package:flutter/material.dart';


class SplashScreem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset("assets/image/sfondo_destination_home.png",
              fit: BoxFit.fill),
              ),


          ],
        ),
      ),
    );
  }

}