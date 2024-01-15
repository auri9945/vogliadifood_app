import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/helper.dart';

class ListaRistorantiCategorie extends StatelessWidget {
  const ListaRistorantiCategorie({
    Key? key,
    required Image image,
    required String name,
    required String rate,
    required String categoria,
  }) : _image = image,
        _name = name,
        _rate = rate,
        _categoria = categoria,
        super(key: key);

  final Image _image;
  final String _name;
  final String _rate;
  final String _categoria;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
              width: 200,
              height: 200,
              child: _image
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          _name,
          style: Helper.getTheme(context)
              .headline5
              ?.copyWith(color: AppColors.Bianco),
        ),
        Row(
          children: [
            Image.asset(
              Helper.getAssetName(
                  "star_filled.png", "virtual"),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              _rate,
              style: TextStyle(
                color: AppColors.Orange,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 5.0,
              ),
              child: Text(
                ".",
                style: TextStyle(
                  color: AppColors.Rosso,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(_categoria),
          ],
        ),
      ],
    );
  }
}

