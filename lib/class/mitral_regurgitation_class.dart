import '../data/constants.dart';
import 'mytile.dart';

class MR {
  double venaContrata;
  //bool holodiastolicAorticFlowReversal;
  bool symptomatic;
  //bool otherCardiacSurgery;
  bool lowSurgicalRisk;
  double rVol;
  double rf;
  double ero;

  double lvef;

  double lvesd;
  double lvedd;

  bool newOnsetAF;
  double pASP;
  double likelyPossibleRepair;
  double expectedMortality;
  //String typeOfMr;

  String likelyhoodAndMortality() {
    print(lowSurgicalRisk);
    return (lowSurgicalRisk)
        ? primaryMR + severMR + resultMVRepair2a
        : primaryMR + severMR + resultPeriodicMon;
  }

  List<bool> getMRStatue() {
    String tempValue = managementSuggestion();
    List<bool> returnValue;
//    print(tempValue.contains(severMR));
    if (tempValue.contains(severMR)) {
      returnValue[0] = true;
    } else
      returnValue[0] = false;
    if (!tempValue.contains(resultPeriodicMon)) {
      returnValue[1] = true;
    } else
      returnValue[1] = false;
    return returnValue;
  }

  bool getMRSurgeryValue() {
    String tempValue = managementSuggestion();
    if (!tempValue.contains(resultPeriodicMon)) {
      return true;
    }
    return false;
  }

  String managementSuggestion() {
    if (venaContrata >= 7 || rVol >= 60 || rf >= 50 || ero >= 4) {
      if (symptomatic) {
        return (lvef > 30)
            ? primaryMR + severMR + resultMVSurgery1
            : primaryMR + severMR + resultMVSurgery2b;
      } else {
        if ((lvef >= 30 && lvef < 59) || lvesd >= 40) {
          return primaryMR + severMR + resultMVSurgery1;
        } else if ((lvef >= 60 && lvesd < 40) || (newOnsetAF || pASP > 50)) {
          print('i am here');
          return likelyhoodAndMortality();
        }
      }
    } else if (venaContrata < 7 || rVol < 60 || rf < 50 || ero < 0.4)
      return primaryMR + progMRB + resultPeriodicMon;
    else
      return 'Unknown condition 1';
  }

  List<MyTile> converter() {
    List<MyTile> temp = <MyTile>[];
    List<MyTile> child = <MyTile>[];

    temp.add(MyTile(
        'Vena Contrata', <MyTile>[MyTile(this.venaContrata.toString())]));
//    temp.add(MyTile('Holodiastolic Aortic Flow Reversal',
//        <MyTile>[MyTile(this.holodiastolicAorticFlowReversal.toString())]));
    temp.add(MyTile('Regurgitation volume (mL/Beat)',
        <MyTile>[MyTile(this.rVol.toString())]));
    temp.add(MyTile(
        'Regurgitation fraction (%)', <MyTile>[MyTile(this.rf.toString())]));
    temp.add(MyTile('ERO', <MyTile>[MyTile(this.ero.toString())]));
    temp.add(
        MyTile('symptomatic', <MyTile>[MyTile(this.symptomatic.toString())]));
    temp.add(MyTile('LVEF (%)', <MyTile>[MyTile(this.lvef.toString())]));
//    temp.add(MyTile('Other Cadiac Surgery',
//        <MyTile>[MyTile(this.otherCardiacSurgery.toString())]));
    temp.add(MyTile('LVESD (%)', <MyTile>[MyTile(this.lvesd.toString())]));
    temp.add(MyTile('LVEDD (%)', <MyTile>[MyTile(this.lvedd.toString())]));
    temp.add(MyTile(
        'Surgical Risk', <MyTile>[MyTile(this.lowSurgicalRisk.toString())]));
    temp.add(
        MyTile('Surgical Risk', <MyTile>[MyTile(this.managementSuggestion())]));
    return temp;
  }
}
