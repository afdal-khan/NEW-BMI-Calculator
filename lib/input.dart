import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Reusable_card.dart';
import 'Reusable_Icon.dart';

const double bottomHeight = 80.0;
const Color activeColor = Color(0xFF1D1E33);
const Color bottomNavColor = Color(0xFFEB1555);
const Color inactiveColor = Color(0xFF111328);
class InputPage extends StatefulWidget { 
  @override
  _InputPageState createState() => _InputPageState();
}

 enum GenderType {
   male,
   female,
 }

class _InputPageState extends State<InputPage> {
  
  Color maleColor = inactiveColor;
  Color femaleColor = inactiveColor;
  
  GenderType selectedGender; 
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: GestureDetector(
                               onTap: () {
                                 setState(() {
                                selectedGender = GenderType.male;   

                                 
                                 });
                               },
                              child: new Reusablecard(color: selectedGender == GenderType.male ? activeColor : inactiveColor,
                cardIcon: new ReusableIcon(icon: FontAwesomeIcons.mars, gender: "male",),),
              ),),
         
         Expanded(child: GestureDetector(
                    onTap: () {

                      setState(() {
                      selectedGender = GenderType.female;
                      
                      });
                    },
                    child: Reusablecard(color: selectedGender == GenderType.female? activeColor : inactiveColor, cardIcon: ReusableIcon(
             icon: FontAwesomeIcons.venus,
             gender: "female",
           ),),
         ),),
            ],

          ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: Reusablecard(color: activeColor),
              ),
            ],
          ),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: Reusablecard(color: activeColor),),
         Expanded(child: Reusablecard(color: activeColor),),
            ],
          ),),
        Container(
          color: bottomNavColor,
          height: bottomHeight,
          margin: EdgeInsets.only(top: 10.0),
        ),
        ],
      ),
   
    );
  }
}






 