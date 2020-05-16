import '../data/constants.dart';
import 'mytile.dart';

class AR {
  double venaContrata;
  bool holodiastolicAorticFlowReversal;
  double rVol;
  double rf;
  double ero;
  //bool lVDialation;
  bool symptomatic;
  double lvef;
  bool otherCardiacSurgery;
  double lvesd;
  double lvedd;
  bool lowSurgicalRisk;

  String managementSuggestion() {
    if (venaContrata > 6 ||
        holodiastolicAorticFlowReversal ||
        rVol >= 60 ||
        rf >= 50 ||
        ero >= 0.3) {
      if (symptomatic) {
        return severAr + resultAvr1;
      } else if (lvef < 50 || otherCardiacSurgery) {
        return severAr + resultAvr1;
      } else if (lvef >= 50 && lvesd > 50) {
        return severAr + resultAvr2A;
      } else if (lvef > 50 && lvedd > 65) {
        return severAr + resultAvr2B;
      } else if (lvef > 50 && lvesd <= 50 && lvedd <= 65) {
        return severAr + resultPeriodicMon;
      } else {
        return 'Unknown condition 1';
      }
    } // Severe AR
    else if (venaContrata <= 6 && rVol < 0.6 && rf < 50 && ero < 0.3) {
      if (otherCardiacSurgery) {
        return progressiveAr + resultAvr2A;
      } else {
        return progressiveAr + resultPeriodicMon;
      }
    } else {
      return 'Unknwon condition 2';
    }
  }

  List<MyTile> converter() {
    List<MyTile> temp = <MyTile>[];
    List<MyTile> child = <MyTile>[];

    temp.add(MyTile(
        'Vena Contrata', <MyTile>[MyTile(this.venaContrata.toString())]));
    temp.add(MyTile('Holodiastolic Aortic Flow Reversal',
        <MyTile>[MyTile(this.holodiastolicAorticFlowReversal.toString())]));
    temp.add(MyTile('Regurgitation volume (mL/Beat)',
        <MyTile>[MyTile(this.rVol.toString())]));
    temp.add(MyTile(
        'Regurgitation fraction (%)', <MyTile>[MyTile(this.rf.toString())]));
    temp.add(MyTile('ERO', <MyTile>[MyTile(this.ero.toString())]));
    temp.add(
        MyTile('symptomatic', <MyTile>[MyTile(this.symptomatic.toString())]));
    temp.add(MyTile('LVEF (%)', <MyTile>[MyTile(this.lvef.toString())]));
    temp.add(MyTile('Other Cadiac Surgery',
        <MyTile>[MyTile(this.otherCardiacSurgery.toString())]));
    temp.add(MyTile('LVESD (%)', <MyTile>[MyTile(this.lvesd.toString())]));
    temp.add(MyTile('LVEDD (%)', <MyTile>[MyTile(this.lvedd.toString())]));
    temp.add(MyTile(
        'Surgical Risk', <MyTile>[MyTile(this.lowSurgicalRisk.toString())]));
    temp.add(MyTile('Management Suggestion',
        <MyTile>[MyTile(this.managementSuggestion())]));
    return temp;
  }
}
