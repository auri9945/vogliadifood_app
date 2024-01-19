import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vogliadifood_app/screens/signUpScreen.dart';
import 'package:vogliadifood_app/utils/colors.dart';
import 'package:vogliadifood_app/utils/helper.dart';

import 'homeScreen.dart';



class LoginScreen extends StatefulWidget {
  static const routeName = "/loginScreen";

  @override
  _LoginScreenState createState() =>  _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  late Box box1;

  @override
    void initState() {
    super.initState();
    createBox();
    getData();
  }

  void createBox()async{
    box1 = await Hive.openBox("login");
  }

  void getData()async{
    if(box1.get('email')!= null){
      email.text= box1.get('email');
    }
    if(box1.get('password')!= null){
      password.text= box1.get('password');
    }
  }

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
                    "Login",
                    style: Helper.getTheme(context).headline6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Inserisci i tuoi dati per accedere",
                      style: Helper.getTheme(context).headline5),
                  SizedBox(
                    height: 40,
                  ),
                  CustomTextInput(
                    hintText: "La tua email",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextInput(
                    hintText: "password",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
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
                            /*login();*/
                            .pushReplacementNamed(HomeScreen.routeName);
                      },
                      child: Text("Login"),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(SignUpScreen.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Non hai un account?",
                            style: Helper.getTheme(context).headline5),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Sign up",
                          style: TextStyle(
                              color: AppColors.Orange,
                              fontWeight: FontWeight.bold),
                        ),
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
    Key? key,
  })
      : _hintText = hintText,
        super(key: key);

  final String _hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50,
      decoration: ShapeDecoration(
        color: AppColors.Bianco,
        shape: StadiumBorder(),
      ),
      child: TextField(
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
/*void login(){
    box1.put('email', email.text);
    box1.put('password', password.text);
}*/
}