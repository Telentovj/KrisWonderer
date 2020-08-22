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
        backgroundColor: Colors.teal,
       title: Text('What kind of person are you?'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: GridView.count(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
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
      child: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 27),
          )
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Logo/${title.toLowerCase()}.jpg"),
            fit: BoxFit.cover,
          ),
          shape: BoxShape.rectangle,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DelayInput(personality: personality),
          )
        );
      },
    );
  }
}
