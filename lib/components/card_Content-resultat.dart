import 'package:flutter/cupertino.dart';

class CardContentResultat extends StatelessWidget {
  final int poids;
  final int taille;
  final int age;

  const CardContentResultat(
      {@required this.poids, @required this.taille, @required this.age});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            children: [
              Text('LE RESULAT'),
            ],
          ),
        ),
      ],
    );
  }
}
