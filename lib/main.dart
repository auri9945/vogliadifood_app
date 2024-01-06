import 'package:flutter/material.dart';
import 'package:vogliadifood_app/screens/loginScreen.dart';
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
          headline6: TextStyle(color: AppColors.Orange,fontSize: 25),
          bodyText2: TextStyle
            (color: AppColors.Bianco,),),),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,

      home: SplashScreen(),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        //SignUpScreen.routeName: (context) => SignUpScreen(),
        //ForgetPwScreen.routeName: (context) => ForgetPwScreen(),
        //SendOTPScreen.routeName: (context) => SendOTPScreen(),
        //NewPwScreen.routeName: (context) => NewPwScreen(),
        //IntroScreen.routeName: (context) => IntroScreen(),
        //HomeScreen.routeName: (context) => HomeScreen(),
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


