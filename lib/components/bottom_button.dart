


import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({required this.onPressed, required this.title});
  final Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(child: Text(title, style: kLargeButtonStyle,)),
        color: Colors.red,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 80,
      ),
    );
  }
}
