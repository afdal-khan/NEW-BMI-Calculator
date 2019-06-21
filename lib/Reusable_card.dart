import 'package:flutter/material.dart';

class Reusablecard extends StatelessWidget {
 final Color color;
 final Widget cardIcon;

  Reusablecard({@required this.color,this.cardIcon}); 
  @override
  Widget build(BuildContext context) {
    return Container(
       child: cardIcon,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(color: color,
        borderRadius: BorderRadius.circular(10.0)),
      );
  }
}
