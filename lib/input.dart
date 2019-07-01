import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Reusable_card.dart';
import 'Reusable_Icon.dart';
import 'constants.dart';


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
   int height = 180;
   int weight = 60;
   int age = 18;
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
              Expanded(child: new Reusablecard(
                detector: (){
                  setState(() {
                   selectedGender = GenderType.male; 
                  });
                },
                color: selectedGender == GenderType.male ? activeColor : inactiveColor,
                cardIcon: new ReusableIcon(icon: FontAwesomeIcons.mars, gender: "male",),),),
         
         Expanded(child: Reusablecard(
           detector: (){
             setState(() {
              selectedGender = GenderType.female; 
             });
           },
           color: selectedGender == GenderType.female? activeColor : inactiveColor, cardIcon: ReusableIcon(
             icon: FontAwesomeIcons.venus,
             gender: "female",
           ),),),
            ],

          ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: Reusablecard(color: activeColor,
                cardIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("HEIGHT",
                    style: labelStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                      Text(height.toString(),
                      style: numberSize,),
                      Text('cm',
                      style: labelStyle,),
                    ],),
                    SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Color(0xFFEB1555),
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                                          child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 250,
                       
                        onChanged: (double newValue){
                           setState(() {
                            height = newValue.round(); 
                           });
                        },
                      ),
                    ),
                  ],
                ),),
              ),
            ],
          ),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: Reusablecard(color: activeColor,
               cardIcon: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text("Weight",style: labelStyle,),
                   Text(weight.toString(), style: numberSize),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Roundbutton(icon: FontAwesomeIcons.plus,
                       onpress: (){
                         setState(() {
                           weight++; 
                         });
                       },
                       ),
                       SizedBox(width: 10.0,),
                       Roundbutton(icon: FontAwesomeIcons.minus,
                       onpress: (){
                         setState(() {
                          weight--; 
                         });
                       },
                       ),
                     ],
                   ),



                 ],
               ),),),
         Expanded(child: Reusablecard(color: activeColor,
         cardIcon: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Text("Age", style: labelStyle),
             Text(age.toString(), style: numberSize,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Roundbutton(
                   icon: FontAwesomeIcons.plus,
                   onpress: (){
                     setState(() {
                      age ++; 
                     });
                   },
                 ),
                 SizedBox(width: 10.0,),
                 Roundbutton(
                   icon: FontAwesomeIcons.minus,
                   onpress: (){
                     setState(() {
                      age --; 
                     });
                   },
                 ),
               ],
             ),
           ],
         ),
         ),
         ),
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



class Roundbutton extends StatelessWidget {
  
  final IconData icon;
  final Function onpress;

  Roundbutton({this.icon,this.onpress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      onPressed: onpress,
      constraints: BoxConstraints.tightFor(
  width: 56.0,
  height: 56.0,
),
    );
  }
}