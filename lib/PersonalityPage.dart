import 'package:flutter/material.dart';
import 'package:kriswonderer/DelayInput.dart';
import 'Personality.dart';

class PersonalityPage extends StatefulWidget {
  @override
  _PersonalityPageState createState() => _PersonalityPageState();
}

class _PersonalityPageState extends State<PersonalityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xfffcb130)),
        title: Text(
          'What describes you the best?',
          style: TextStyle(
            color: Color(0xfffcb130),
            fontFamily: "Sigvar",
          )
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: GridView.count(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.all(10),
              crossAxisSpacing: 15,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              children: <Widget>[
                _buildPersonality(title: "Foodie", personality: Personality.FOODIE),
                _buildPersonality(title: "Adventurous", personality: Personality.ADVENTUROUS),
                _buildPersonality(title: "Artistic", personality: Personality.ARTISTIC),
                _buildPersonality(title: "Nature Lover", personality: Personality.NATURE_LOVER),
                _buildPersonality(title: "Shopaholic", personality: Personality.SHOPAHOLIC),
                _buildPersonality(title: "Spontaneous", personality: Personality.SPONTANEOUS),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonality({String title, String image, Personality personality}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DelayInput(personality: personality),
            )
        );
      },
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[600],
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
              image: DecorationImage(
                image: AssetImage("assets/Logo/${title.toLowerCase()}.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(70, 0, 0, 0),
                  Color.fromARGB(70, 0, 0, 0)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )
            ),
          ),
          Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: "GTEestiProText"
              ),
            ),
          ),
        ],
      ),
    );
  }
}
