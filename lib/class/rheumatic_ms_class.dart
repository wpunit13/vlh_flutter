import '../data/constants.dart';
import 'mytile.dart';

class RMS {
  double mva;
  bool symptomatic;
  double tHalf;
  bool lAClot;
  bool noOrMildMr;
  bool symptomsNYHAClassIIIV;
  bool favValveMorphology;

  bool highSurgicalRisk;
  bool newOnsetAF;
  double pCWP;

  bool getRMSSurgeryValue() {
    String tempValue = managementSuggestion();
    if (tempValue.contains(resultMSMVR1)) {
      return true;
    }
    return false;
  }

  String managementSuggestion() {
    print(((mva ?? 2) <= 1.5 && (mva ?? 0.9) > 1) ||
        ((tHalf ?? 0) >= 150 && (tHalf ?? 220) < 220));
    if (((mva ?? 2) <= 1) || ((tHalf ?? 100) >= 220)) {
      print('VSMS');
      if (symptomatic) {
        if (favValveMorphology && noOrMildMr && lAClot == false) {
          return vSMS + resultMSPbmc1;
        } else if (symptomsNYHAClassIIIV && highSurgicalRisk) {
          return vSMS + resultMSPbmc2b;
        } else {
          return vSMS + resultMSMVR1;
        }
      } else {
        if (favValveMorphology && noOrMildMr && lAClot == false) {
          return vSMS + resultMSPbmc2a;
        } else {
          return vSMS + resultPeriodicMon;
        }
      }
    } else if (((mva ?? 2) <= 1.5 && (mva ?? 0.9) > 1) ||
        ((tHalf ?? 0) >= 150 && (tHalf ?? 220) < 220)) {
      print('sever MS');
      if (symptomatic) {
        if (favValveMorphology && noOrMildMr && lAClot == false) {
          return sMS + resultMSPbmc1;
        } else if (symptomsNYHAClassIIIV && highSurgicalRisk) {
          return sMS + resultMSPbmc2b;
        } else {
          return sMS + resultMSMVR1;
        }
      } else {
        if (newOnsetAF) {
          if (favValveMorphology && noOrMildMr && lAClot == false) {
            return sMS + resultMSPbmc2b;
          } else {
            return sMS + resultPeriodicMon;
          }
        } else {
          return sMS + resultPeriodicMon;
        }
      }
    } else if (mva > 1.5 && tHalf < 150) {
      print('progressive MS');
      if (pCWP > 25) {
        return progMS + resultMSPbmc2b;
      } else
        return progMS + resultPeriodicMon;
    } else {
      print('unknown condition 1');
      return 'UNK1';
    }
  }

  List<MyTile> converter() {
    List<MyTile> temp = <MyTile>[];
    List<MyTile> child = <MyTile>[];

    temp.add(
        MyTile('Mitral Valve Area', <MyTile>[MyTile(this.mva.toString())]));
    temp.add(
        MyTile('symptomatic', <MyTile>[MyTile(this.symptomatic.toString())]));

    temp.add(
        MyTile('Pressure half-time', <MyTile>[MyTile(this.tHalf.toString())]));
    temp.add(
        MyTile('Left Artrial Clot', <MyTile>[MyTile(this.lAClot.toString())]));
    temp.add(
        MyTile('No or Mild MR', <MyTile>[MyTile(this.noOrMildMr.toString())]));
    temp.add(MyTile('NYHA Class III-IV symptoms ',
        <MyTile>[MyTile(this.symptomsNYHAClassIIIV.toString())]));

    temp.add(MyTile(
        'Surgical Risk', <MyTile>[MyTile(this.highSurgicalRisk.toString())]));
    temp.add(
        MyTile('New onset AF', <MyTile>[MyTile(this.newOnsetAF.toString())]));
    temp.add(MyTile('Pulmonary capillary wedge pressure (mm Hg)',
        <MyTile>[MyTile(this.pCWP.toString())]));
    temp.add(MyTile('Management Suggestion',
        <MyTile>[MyTile(this.managementSuggestion())]));

    return temp;
  }
}
