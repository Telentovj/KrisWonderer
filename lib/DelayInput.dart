import 'package:flutter/material.dart';
import "package:numberpicker/numberpicker.dart";
import 'Home.dart';
import 'Personality.dart';

class DelayInput extends StatefulWidget {
  final Personality personality;

  DelayInput({
    Key key,
    @required this.personality
  }) : super(key: key);

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
        backgroundColor: Colors.teal,
        title: Text('How long is your delay?')
      ),
      body: _buildTimeSetter(),
    );
  }

  Widget _buildTimeSetter(){
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
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (BuildContext context) => StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Home(
                          personality: widget.personality,
                          duration: Duration(hours: hours + days * 24, minutes: minutes),
                        );
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

