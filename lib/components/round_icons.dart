import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icons, required this.onpress});

  final IconData icons;
  final Function()? onpress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      child: Icon(icons),
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      onPressed: onpress,
      shape: CircleBorder(),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: Colors.red,
    );
  }
}
