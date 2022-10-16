import 'package:flutter/material.dart';
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        backgroundColor: Color(0xFF1D1E33),
      ),
      body:Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: Reusable(
          colour:Color(0xFF1D1E33 ),
          ),
              ),
              Expanded(child: Reusable(colour:Color(0xFF1D1E33 ),),
              )
            ],
          )),
          Expanded(child: Row(
            children: [Expanded(child: Reusable(
                colour:Color(0xFF1D1E33 ),
            ))],
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: Reusable(
                  colour:Color(0xFF1D1E33 ),
              )),
              Expanded(child: Reusable(
                  colour:Color(0xFF1D1E33 ),
              )),
            ],
          )),
        ],
      )
    );
  }
}
class Reusable extends StatelessWidget {
  Reusable({@required this.colour});
final Color colour;
  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.all(15.0),
    decoration: BoxDecoration(
color: colour,
      borderRadius: BorderRadius.circular(10.0),

    ),
              );
  }
}
