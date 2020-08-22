import 'package:flutter/material.dart';
import "package:numberpicker/numberpicker.dart";

import 'Home.dart';
class DelayInput extends StatefulWidget {
  final String personality;
  DelayInput({Key key, @required this.personality}) : super(key: key);
  @override
  _DelayInputState createState() => _DelayInputState();
}

class _DelayInputState extends State<DelayInput> {
  int days = 0;
  int hours = 0;
  int minutes = 0;

  @override
  Widget build(BuildContext context) {
    print(widget.personality);
    return Scaffold(
      appBar: AppBar(
        title: Text('How long is your delay?')
      ),
      body: TimerSetter(),
    );
  }


  Widget TimerSetter(){
    return Column(
      children: <Widget>[
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text("Days"),
                NumberPicker.integer(
                  initialValue: 0,
                  minValue: 0,
                  maxValue: 24,
                  infiniteLoop: true,
                  onChanged: (val) => days = val,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text("Hrs"),
                NumberPicker.integer(
                  initialValue: 0,
                  minValue: 0,
                  maxValue: 60,
                  infiniteLoop: true,
                  onChanged: (val) => hours = val,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text("Mins"),
                NumberPicker.integer(
                  initialValue: 0,
                  minValue: 0,
                  maxValue: 60,
                  infiniteLoop: true,
                  onChanged: (val) => minutes = val,
                ),
              ],
            ),
          ],
        ), // Row of NumberPickers
        SizedBox(height: 20),
        Center( // Start button
          child: Container(
            child: Ink(
              decoration: ShapeDecoration(
                color: Color(0xffDB3A34),
                shape: CircleBorder(),
              ),
              child: IconButton(
                  icon: Icon(Icons.play_arrow),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) => StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
                              return Home(personality: widget.personality, hours: hours, days: days, minutes: minutes);
                            }
                        )
                    ));
                  }
              ),
            ),
          ),
        ),
      ],
    );
  }
}

