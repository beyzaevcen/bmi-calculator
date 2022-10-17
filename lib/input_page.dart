import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/reusable_card.dart';

const bottomContainerHeight=80.0;
final activeColour=Color(0xFF1D1E33);
const inActiveCardColour=Color(0xFF111328);
final bottomContainerColour=Colors.purple[100];

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  Color maleCardColour=inActiveCardColour;
  Color femaleCardColour=inActiveCardColour;
  //1=male 2=female
  void updateColour(int gender){
if(gender==1){
  if(maleCardColour==inActiveCardColour){
    maleCardColour=activeColour;
  }else{
    maleCardColour=inActiveCardColour;
  }
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "BMI CALCULATOR",
        ),
        backgroundColor:activeColour,
      ),
      body:Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: GestureDetector(
                onTap: (){
                 setState(() {
                   updateColour(1);
                 });
                },
                child: Reusable(
          colour:maleCardColour,
                  cardChild: IconAdd(icon: FontAwesomeIcons.mars,label: "MALE",),
          ),
              ),
              ),
              Expanded(child: Reusable(
                colour:femaleCardColour,
                cardChild: IconAdd(icon: FontAwesomeIcons.venus,label: "FEMALE",),
              ),
              )
            ],
          )),
          Expanded(child: Row(
            children: [Expanded(child: Reusable(
                colour:activeColour,
            ))],
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: Reusable(
                  colour:activeColour,
              )),
              Expanded(child: Reusable(
                  colour:activeColour,
              )),
            ],
          )),
          Container(
            color: bottomContainerColour,
            margin: EdgeInsets.only(top:10.0),
            width: double.infinity,
            height: bottomContainerHeight,
            child: Expanded(
              child: Text(
                  "CALCULATE",),
            ),
          ),
        ],
      )
    );
  }
}





