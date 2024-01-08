import 'package:flutter/material.dart';
import 'package:vogliadifood_app/screens/homeScreen.dart';
import 'package:vogliadifood_app/screens/loginScreen.dart';
import 'package:vogliadifood_app/screens/signUpScreen.dart';
import 'package:vogliadifood_app/utils/colors.dart';
import './screens/spashScreen.dart';
import 'screens/introScreen.dart';

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
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              AppColors.Rosso,
            ),
            shape: MaterialStateProperty.all(
              StadiumBorder(),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor:
            MaterialStateProperty.all(AppColors.Rosso),
          ),
        ),
        textTheme: TextTheme(
          headline4: TextStyle(color: AppColors.Text, fontSize: 18),
          headline6: TextStyle(color: AppColors.Bianco, fontSize: 25),
          headline5: TextStyle(color: AppColors.Bianco, fontSize: 15),
          headline3: TextStyle(color: AppColors.Bianco, fontSize:30),
          headline2: TextStyle(color: AppColors.Bianco, fontSize:12),
          headline1: TextStyle(color: AppColors.Text, fontSize: 16),
          bodyText2: TextStyle(
            color: AppColors.Bianco,
          ),
        ),
      ),
      // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // useMaterial3: true,

      home: SplashScreen(),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        IntroScreen.routeName: (context) => IntroScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        //MenuScreen.routeName: (context) => MenuScreen(),
        //OfferScreen.routeName: (context) => OfferScreen(),
        // ProfileScreen.routeName: (context) => ProfileScreen(),
        // MoreScreen.routeName: (context) => MoreScreen(),
        // DessertScreen.routeName: (context) => DessertScreen(),
        // IndividualItem.routeName: (context) => IndividualItem(),
        // PaymentScreen.routeName: (context) => PaymentScreen(),
        // NotificationScreen.routeName: (context) => NotificationScreen(),
        // AboutScreen.routeName: (context) => AboutScreen(),
        // InboxScreen.routeName: (context) => InboxScreen(),
        // MyOrderScreen.routeName: (context) => MyOrderScreen(),
        // CheckoutScreen.routeName: (context) => CheckoutScreen(),
        // ChangeAddressScreen.routeName: (context) => ChangeAddressScreen(),
      },
    );
  }
}
