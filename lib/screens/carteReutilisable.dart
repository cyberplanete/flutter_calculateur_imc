import 'package:flutter/cupertino.dart';

class CarteReutilisable extends StatelessWidget {
  final Color couleur;
  final Widget carteContent;
  final Function onPress;
  CarteReutilisable({@required this.couleur, this.carteContent, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: carteContent,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: couleur,
        ),
      ),
    );
  }
}
