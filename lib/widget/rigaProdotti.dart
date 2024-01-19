import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/helper.dart';


class RigaProdotti extends StatelessWidget {
  const RigaProdotti({
    required String prodotto,
    required String numero,
    Key? key,
  }): _prodotto = prodotto, _numero = numero, super(key: key);

  final String _prodotto;
  final String _numero;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(_prodotto,
            style: Helper.getTheme(context).headline5,
          ),
          Row(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(5.0),
                ),
                onPressed: (){

                },
                child: Text("-",
                  style: Helper.getTheme(context).headline6,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 30,
                width: 50,
                decoration: ShapeDecoration(
                  shape: StadiumBorder(
                      side: BorderSide(
                        color: AppColors.Bianco,
                      )
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( _numero,
                      style: Helper.getTheme(context).headline5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(5.0),
                ),
                onPressed: (){},

                child: Text("+",
                  style: Helper.getTheme(context).headline6,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}