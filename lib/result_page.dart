import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';

class ResultPage extends StatelessWidget {
  final String  bmiResult;
  final String resultText;
  final String interpretation;


  ResultPage({@required this.bmiResult, @required this.resultText,@required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
backgroundColor: Color(0xFF0A0E21),
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child:Container(
                  padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                    "Your Result: ",
                  style: kTitleText,
                ),
              ),
              ),
              Expanded(
                  flex: 5,
                child:Reusable(
                  colour: kActiveColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                          resultText.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: kResultText,

                        ),
                      Text(
                        bmiResult,
textAlign: TextAlign.center,
style: kBMIstyle,
                      ),
                      Text(
                         interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                          )

                    ],

                ) ,
              ),
                
              ),

              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Expanded(
                child: Container(
                  child:Center(
                    child: Text(
                      'RE-CALCULATE',
                      style: kLargeButtonTextStyle,),
                  ),
                  color: kBottomContainerColour,
                  margin: EdgeInsets.only(top:10.0),
                  padding: EdgeInsets.only(bottom: 20.0),
                  width: double.infinity,
                  height: kBottomContainerHeight,

                ),
                ),
              )
            ],
      ),

    );
  }
}
