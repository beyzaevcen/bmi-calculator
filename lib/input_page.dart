import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
const bottomContainerHeight=80.0;
final activeColour=Color(0xFF1D1E33);
final bottomContainerColour=Colors.purple[100];
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
        backgroundColor:activeColour,
      ),
      body:Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: Reusable(
          colour:activeColour,
                cardChild: IconAdd(),
          ),
              ),
              Expanded(child: Reusable(
                colour:activeColour,
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

class IconAdd extends StatelessWidget {
  const IconAdd({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          FontAwesomeIcons.mars,
          size:80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          "MALE",
          style: TextStyle(
          fontSize: 18.0,
          color: Color(0xFFB3ABABFF),
        ),)
      ],
    );
  }
}
class Reusable extends StatelessWidget {
  Reusable({@required this.colour, this.cardChild});
final Color colour;
final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
    margin: EdgeInsets.all(15.0),
    decoration: BoxDecoration(
color: colour,
      borderRadius: BorderRadius.circular(10.0),

    ),
              );
  }
}
