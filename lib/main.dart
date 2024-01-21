import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive_flutter/adapters.dart';
import 'package:vogliadifood_app/screens/casaScreen.dart';
import 'package:vogliadifood_app/screens/dolciScreen.dart';
import 'package:vogliadifood_app/screens/idividualItem.dart';
import 'package:vogliadifood_app/screens/mareScreen.dart';
import 'package:vogliadifood_app/screens/riepilogoScreen.dart';
import 'package:vogliadifood_app/screens/salutareScreen.dart';
import 'package:vogliadifood_app/screens/schifezzeScreen.dart';
import 'package:vogliadifood_app/screens/veggieScreen.dart';
import 'package:vogliadifood_app/screens/fusionScreen.dart';
import 'package:vogliadifood_app/screens/gourmetScreen.dart';
import 'package:vogliadifood_app/screens/mondoScreen.dart';
import 'package:vogliadifood_app/model/user_account.dart';

import './screens/spashScreen.dart';
import './screens/loginScreen.dart';
import './screens/signUpScreen.dart';
import './screens/introScreen.dart';
import './screens/homeScreen.dart';
import './screens/CategorieScreen.dart';
import './screens/profiloScreen.dart';
import './utils/colors.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Hive.initFlutter();
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
          headline1: TextStyle(color: AppColors.Text, fontSize: 16),
          headline2: TextStyle(color: AppColors.Bianco, fontSize:12),
          headline3: TextStyle(color: AppColors.Bianco, fontSize:30),
          headline4: TextStyle(color: AppColors.Text, fontSize: 18),
          headline5: TextStyle(color: AppColors.Bianco, fontSize: 16),
          headline6: TextStyle(color: AppColors.Bianco, fontSize: 25),
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
        CategorieScreen.routeName: (context) => CategorieScreen(),
        ProfiloScreen.routeName: (context) => ProfiloScreen(),
        SchifezzeScreen.routeName: (context) => SchifezzeScreen(),
        DolciScreen.routeName: (context) => DolciScreen(),
        VeggieScreen.routeName: (context) => VeggieScreen(),
        MondoScreen.routeName: (context) => MondoScreen(),
        FusionScreen.routeName: (context) => FusionScreen(),
        GourmetScreen.routeName: (context) => GourmetScreen(),
        MareScreen.routeName: (context) => MareScreen(),
        SalutareScreen.routeName: (context) => SalutareScreen(),
        CasaScreen.routeName: (context) => CasaScreen(),
        IndividualItem.routeName: (context) => IndividualItem(),
        ProfiloScreen.routeName: (context) => ProfiloScreen(),
        RiepilogoScreen.routeName: (context) => RiepilogoScreen(),
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


