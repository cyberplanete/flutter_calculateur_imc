import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoutonCercle extends StatelessWidget {
  BoutonCercle({@required this.iconAddOrSubstrac, @required this.onClique});
  final IconData iconAddOrSubstrac;
  final Function onClique;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconAddOrSubstrac),
      onPressed: onClique,
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}