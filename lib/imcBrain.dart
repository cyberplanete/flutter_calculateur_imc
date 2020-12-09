import 'dart:math';
import 'imc.dart';

class ImcBrain {
  int poids;
  int tailleCm;
  double indiceIMC;
  IMC imc;

  ImcBrain({this.tailleCm, this.poids});

  List<IMC> listImc = [
    IMC(
        maxIMC: 16.5,
        minIMC: 0,
        interpretation: 'Dénutrition',
        recommandation: 'Surveillez votre corpulence, cet IMC est très faible'),
    IMC(
        maxIMC: 18.5,
        minIMC: 16.5,
        interpretation: 'Maigreur',
        recommandation: 'Surveillez votre corpulence, cet IMC est peu élevé.'),
    IMC(
        maxIMC: 25,
        minIMC: 18.5,
        interpretation: 'Corpulence Normale',
        recommandation:
            'Votre corpulence est dans la norme, entre 18.5 et 25, c\'est très bien'),
    IMC(
        maxIMC: 30,
        minIMC: 25,
        interpretation: 'Surpoids',
        recommandation:
            'Votre IMC est compris entre 25 et 30. Cela signifie que vous êtes en surpoids. '),
    IMC(
        maxIMC: 35,
        minIMC: 30,
        interpretation: 'Obésité modérée (Classe 1)',
        recommandation:
            'Votre IMC est compris entre 30 et 35. Vous êtes donc dans la première moitié de la fourchette d\'IMC correspondant à une obésité de classe 1 dite modérée. '),
    IMC(
        maxIMC: 40,
        minIMC: 35,
        interpretation: 'Obésité sévère (Classe 2)',
        recommandation:
            'Votre IMC est compris entre 35 et 40. Vous êtes donc dans la deuxième moitié de la fourchette d\'IMC correspondant à une obésité de classe 2 dite sévère. '),
    IMC(
        maxIMC: 100,
        minIMC: 40,
        interpretation: 'Obésite morbide ou massive',
        recommandation:
            'Votre IMC est supérieur à 40, c\'est le stade de l\'obésité morbide (Classe 3). Vous devriez essayez de perdre du poids en évitant les régimes privatifs (néfastes pour la santé). '),
  ];
  String getInterpretation() {
    return imc.interpretation;
  }

//TODO Prendre en compte age lors du calcul et homme ou femme
  double calculIndiceIMC() {
    indiceIMC = (poids / pow(tailleCm / 100, 2));
    listImc.forEach((element) {
      if (indiceIMC >= element.minIMC && indiceIMC < element.maxIMC) {
        imc = element;
      }
    });
    return indiceIMC;
  }

  String getRecommandation() {
    return imc.recommandation;
  }
}
