import 'package:flutter/material.dart';
import 'package:vogliadifood_app/utils/colors.dart';
import './screens/spashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(
          AppColors.Rosso,


        ),
          shape: MaterialStateProperty.all(
              StadiumBorder(),
          ),
        ),
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle
            (color: AppColors.Bianco,),),),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,

      home: SplashScreen(),
    );
  }
}


