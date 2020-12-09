

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculateur_imc/components/Button_bottom.dart';
import 'package:flutter_calculateur_imc/components/button_cercle.dart';
import 'package:flutter_calculateur_imc/components/card_Content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../imcBrain.dart';
import 'carteReutilisable.dart';
import 'resulatIMC.dart';

enum GenderType { Femme, Homme }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardCouleur = kInativeCardCouleur;
  Color femaleCardCouleur = kInativeCardCouleur;
  int poids = 60;
  int tailleCm = 180;
  int age = 19;
  GenderType selectedGender;
  double indiceIMC;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULATRICE IMC'),
      ),
      body: Column(
        children: [
          Expanded(
            // Répartition des rows en %
            child: Row(
              //Répartition des cards à 50% d'espace chacune
              children: [
                Expanded(
                  flex: 5,
                  child: new CarteReutilisable(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.Homme;
                      });
                    },
                    carteContent: new CardContent(
                      genderType: 'Homme',
                      genderIcon: FontAwesomeIcons.mars,
                    ),
                    couleur: selectedGender == GenderType.Homme
                        ? kActiveCardCouleur
                        : kInativeCardCouleur,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: new CarteReutilisable(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.Femme;
                      });
                    },
                    carteContent: new CardContent(
                      genderType: 'Femme',
                      genderIcon: FontAwesomeIcons.venus,
                    ),
                    couleur: selectedGender == GenderType.Femme
                        ? kActiveCardCouleur
                        : kInativeCardCouleur,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            //Taille
            child: Row(
              children: [
                Expanded(
                  flex: 10,
                  child: new CarteReutilisable(
                    couleur: kActiveCardCouleur,
                    carteContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Taille',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //Aligner cm sur 180
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          //Erreur crossAxisAlignment !=
                          // CrossAxisAlignment.baseline || textBaseline != null': is not true.
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              tailleCm.toString(),
                              style: kLabelTextStyleBold,
                            ),
                            Text('cm'),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Color(0xFF8D8E98),
                            overlayColor: Color(0x30eb1555),
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xffeb1555),
                            thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 15.00),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30),
                          ),
                          child: Slider(
                            value: tailleCm.toDouble(),
                            min: 120,
                            max: 220,
                            onChanged: (double newValue) {
                              setState(() {
                                tailleCm = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: new CarteReutilisable(
                    carteContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Poids'),
                        Text(
                          poids.toString(),
                          style: kLabelTextStyleBold,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BoutonCercle(
                                iconAddOrSubstrac: FontAwesomeIcons.minus,
                                onClique: () {
                                  setState(() {
                                    poids--;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            BoutonCercle(
                              iconAddOrSubstrac: FontAwesomeIcons.plus,
                              onClique: () {
                                setState(() {
                                  poids++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    couleur: kActiveCardCouleur,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: new CarteReutilisable(
                    carteContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age'),
                        Text(
                          age.toString(),
                          style: kLabelTextStyleBold,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BoutonCercle(
                                iconAddOrSubstrac: FontAwesomeIcons.minus,
                                onClique: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            BoutonCercle(
                              iconAddOrSubstrac: FontAwesomeIcons.plus,
                              onClique: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    couleur: kActiveCardCouleur,
                  ),
                ),
              ],
            ),
          ),
          new ButtonBottom(
            onTap: () {
              ImcBrain imcBrain =
                  new ImcBrain(poids: poids, tailleCm: tailleCm);

              indiceIMC = imcBrain.calculIndiceIMC();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => new ResultatIMC(
                    imcInterpretation: imcBrain.getInterpretation(),
                    indiceIMC: indiceIMC,
                    imcRecommandation: imcBrain.getRecommandation(),
                  ),
                ),
              );
            },
            buttonTexte: 'Calculer',
          )
        ],
      ),
    );
  }
}
