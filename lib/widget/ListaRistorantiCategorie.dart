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
          child: SizedBox(
              width: 200,
              height: 200,
              child: _image
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          _name,
          style: Helper.getTheme(context)
              .headlineSmall
              ?.copyWith(color: AppColors.Bianco),
        ),
        Row(
          children: [
            Image.asset(
              Helper.getAssetName(
                  "star_filled.png", "virtual"),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              _rate,
              style: const TextStyle(
                color: AppColors.Orange,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(
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
            const SizedBox(
              width: 10,
            ),
            Text(_categoria),
          ],
        ),
      ],
    );
  }
}

