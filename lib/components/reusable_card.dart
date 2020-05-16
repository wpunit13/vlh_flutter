import 'package:flutter/material.dart';

import '../data/constants.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(kReusableCardMargin),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(kReusableCardRadius)),
      ),
    );
  }
}

class BasicCard extends StatelessWidget {
  final Widget cardChild;
  final Color colour;
  BasicCard({this.cardChild, this.colour});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(kReusableCardMargin),
      decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(kReusableCardRadius)),
    );
  }
}
