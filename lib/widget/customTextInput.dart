import 'package:flutter/material.dart';

import '../utils/colors.dart';

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