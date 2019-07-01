import 'package:flutter/material.dart';

class Reusablecard extends StatelessWidget {
 final Color color;
 final Widget cardIcon;
 final Function detector; 

  Reusablecard({@required this.color,this.cardIcon,this.detector}); 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: detector,
          child: Container(
         child: cardIcon,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(color: color,
          borderRadius: BorderRadius.circular(10.0)),
        ),
    );
  }
  
   
}
