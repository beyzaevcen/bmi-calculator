import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'icon_content.dart';

enum Gender{
  male,
  female,
}
Gender selectedG;
int height=180;
int weight=60;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "BMI CALCULATOR",
        ),
        backgroundColor:kActiveColour,
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: Reusable(
                onPress: (){
                  setState(() {
selectedG=Gender.male;
                  });
                },
          colour:selectedG==Gender.male?kActiveColour:kInActiveCardColour,
                cardChild: IconAdd(
                  icon: FontAwesomeIcons.mars,
                  label: "MALE",
                )
          ),
              ),
              Expanded(child: Reusable(
                onPress: (){
                  setState(() {
                    selectedG=Gender.female;
                  });
                },
                colour:selectedG==Gender.female?kActiveColour:kInActiveCardColour,
                cardChild: IconAdd(
                  icon: FontAwesomeIcons.venus,
                  label: "FEMALE",
                )
              ),
              )
            ],
          )),
          Expanded(
              child:
              Reusable(
                colour: kActiveColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("HEIGHT",style: kLabelTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline:TextBaseline.alphabetic ,//We should specify baseline otherwise it gives error
                        children: [
                          Text(height.toString(),
                          style: kNumberTextStyle,
                          ),
                          Text(
                            "cm",
                            style: kLabelTextStyle,
                          )

                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(0xFF570864),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          activeColor: Color(0xFFC496CC),
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newVal){
                            setState(() {
                              height=newVal.round();
                            });
                          },

                        ),
                      ),
                    ],
                  ),
              )
          ),
          Expanded(child: Row(
            children: [
              Expanded(child: Reusable(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("WEIGHT",
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          backgroundColor: Color(0xFF676E8E),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),

                        ),
                        SizedBox(width: 10.0),
                        FloatingActionButton(
                          backgroundColor: Color(0xFF676E8E),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          )
                        )
                      ],

                    ),
                  ],
                ),
                  colour:kActiveColour,
              )),
              Expanded(child: Reusable(
                  colour:kActiveColour,
              )),
            ],
          )),
          Container(
            color: kBottomContainerColour,
            margin: EdgeInsets.only(top:10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
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


