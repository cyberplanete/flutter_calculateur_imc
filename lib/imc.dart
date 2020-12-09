import 'package:flutter/cupertino.dart';

class IMC {
  double maxIMC;
  double minIMC;
  String interpretation;
  String recommandation;
  IMC(
      {@required this.interpretation,
      @required this.recommandation,
      @required this.maxIMC,
      @required this.minIMC});
}
