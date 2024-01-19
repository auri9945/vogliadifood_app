import 'package:flutter/material.dart';
import 'package:vogliadifood_app/screens/introScreen.dart';
import 'package:vogliadifood_app/screens/loginScreen.dart';

import '../utils/colors.dart';
import '../utils/helper.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/signUpScreen";

  const SignUpScreen({Key?key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _indirizzo = TextEditingController();
  TextEditingController _password = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              // padding: const EdgeInsets.symmetric(
              //   horizontal: 20,
              //   vertical: 30,
              // ),
              child: Image.asset(
                Helper.getAssetName("Sfondo_app.png", "virtual"),
                fit: BoxFit.fill,
              ),
            ),


            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Registrati",
                    style: Helper.getTheme(context).headline6,
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Text("Inserisci i tuoi dati per creare il tuo account",
                      style: Helper.getTheme(context).headline5
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  CustomTextInput(
                    hintText: "La tua email",
                    controller: _email,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  CustomTextInput(
                    hintText: "Indirizzo",
                    controller: _indirizzo,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  CustomTextInput(
                    hintText: "password",
                    controller: _password,
                  ),
                  SizedBox(
                    height: 20,
                  ),


                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child:
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.Rosso),
                        foregroundColor: MaterialStateProperty.all(AppColors.Bianco),
                      ),
                      onPressed: (){
                        Registrazione();
                        Navigator.of(context)
                            .pushReplacementNamed(IntroScreen.routeName);
                      },
                      child: Text("Registrati"),
                    ),
                  ),

                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context)
                          .pushReplacementNamed(LoginScreen.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Hai già un account?",
                            style: Helper.getTheme(context).headline5),
                        SizedBox(width: 10,),
                        Text("Login",
                          style: TextStyle(color: AppColors.Orange, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    required String hintText,
    required TextEditingController controller,
    Key? key,
  }) : _hintText = hintText, _controller= controller, super (key: key) ;


  final String _hintText;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: ShapeDecoration(
        color: AppColors.Bianco,
        shape: StadiumBorder(),
      ),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: _hintText,
          hintStyle: TextStyle(
            color: AppColors.Text,
          ),
          contentPadding: const EdgeInsets.only(left: 40),
        ),
      ),
    );
  }
}

Future Registrazione() async {
  var regAPIUrl = "http://protocorderspoint.com/php/registration.php";

   Map maped = {
    'email': _email.text,
    'indirizzo': _indirizzo.text,
    'password': _password.text
};

  http.Response response =await http.post(Uri.parse(regAPIUrl),body:maped);

  var data = jsonDecode(response.body);

  print("Data: ${data}");
  if(data["successo"]=="1"){

  }
}