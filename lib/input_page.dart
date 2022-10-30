import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'icon_content.dart';
import 'result_page.dart';
import 'calculator_brain.dart';

enum Gender{
  male,
  female,
}
Gender selectedG;
int height=180;
int weight=60;
int age=20;

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
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },

                        ),
                        SizedBox(width: 5.0),
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                        onPressed: (){
                          setState(() {
                            weight--;
                          });
                        }
                          ,),

                      ],

                    ),
                  ],
                ),
                  colour:kActiveColour,
              )),
              Expanded(child: Reusable(
                  colour:kActiveColour,
             cardChild: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(
                   "AGE",
                 style: kLabelTextStyle,),
                 Text(
                     age.toString(),
                 style: kNumberTextStyle,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     RoundIconButton(icon: FontAwesomeIcons.plus,
                         onPressed: (){
                       setState(() {
                         age++;
                       });
                         }
                         ),
                     SizedBox(width: 5.0,),
                     RoundIconButton(icon: FontAwesomeIcons.minus,
                         onPressed: (){
                       setState(() {
                         age--;
                       });
                         })
                   ],
                 )
               ],


             ),
              )),
            ],
          )),
          GestureDetector(
            onTap: (){
              CalculatorBrain calc=
              CalculatorBrain( height, weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=>ResultPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),

                      ),
                  ),
              );

            },
            child: Container(
              child:Center(
              child: Text(
                'CALCULATE',
                style: kLargeButtonTextStyle,),
              ),
              color: kBottomContainerColour,
              margin: EdgeInsets.only(top:10.0),
              padding: EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
              height: kBottomContainerHeight,

            ),
          ),
        ],
      )
    );
  }
}
class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  RoundIconButton({@required this.icon,@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      disabledElevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF676E8E),

    );
  }
}



