import 'package:flutter/cupertino.dart';

import '../constants.dart';

class ButtonBottom extends StatelessWidget {
  ButtonBottom({this.onTap, @required this.buttonTexte});
  final Function onTap;
  final String buttonTexte;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          buttonTexte,
          style: kLabelButtonTextStyleBold,
        )),
        color: kBottomCardCouleur,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: kBottomContainerCard,
      ),
    );
  }
}
