import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/helper.dart';

class CategiarieVoglia extends StatelessWidget {
  const CategiarieVoglia({
    Key? key,
    required Image image,
    required String name,
  })  : _image = image,
        _name = name,
        super(key: key);

  final String _name;
  final Image _image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(width: 100, height: 100, child: _image),
        ),
        SizedBox(
          height: 10,
        ),
        Text(_name,
            style: Helper.getTheme(context)
                .headline2
                ?.copyWith(color: AppColors.Bianco)),
      ],
    );
  }
}