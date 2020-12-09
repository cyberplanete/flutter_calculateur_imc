import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculateur_imc/components/Button_bottom.dart';

import '../constants.dart';
import 'carteReutilisable.dart';

class ResultatIMC extends StatelessWidget {
  final String imcInterpretation;
  final String imcRecommandation;
  final double indiceIMC;
  ResultatIMC({this.imcInterpretation, this.indiceIMC, this.imcRecommandation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculatrice IMC'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Text(
                  'Votre Resultat',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 35),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: new CarteReutilisable(
              couleur: kInativeCardCouleur,
              carteContent: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    imcInterpretation.toUpperCase(),
                    style: TextStyle(
                        color: ((indiceIMC > 25 || indiceIMC < 18)
                            ? Colors.red
                            : Colors.green)),
                  ),
                  Text(
                    indiceIMC.toStringAsFixed(1),
                    style: TextStyle(fontSize: 80),
                  ),
                  Text(
                    'Normal IMC est entre:',
                    style: TextStyle(color: Color(0xff8d8e98), fontSize: 18),
                  ),
                  Text(
                    '18.5 - 25 kg/m2',
                    style: TextStyle(fontSize: 18),
                  ),
                  Flex(
                    mainAxisAlignment: MainAxisAlignment.center,
                    direction: Axis.vertical,
                    children: [
                      Container(
                        padding: EdgeInsets.all(25),
                        child: Text(
                          imcRecommandation,
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          ButtonBottom(
            onTap: () {
              Navigator.pop(context);
            },
            buttonTexte: 'Re-calculer',
          )
        ],
      ),
    );
  }
}
