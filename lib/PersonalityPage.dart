import 'package:flutter/material.dart';
import 'package:kriswonderer/DelayInput.dart';

class PersonalityPage extends StatefulWidget {
  @override
  _PersonalityPageState createState() => _PersonalityPageState();
}

class _PersonalityPageState extends State<PersonalityPage> with AutomaticKeepAliveClientMixin<PersonalityPage> {
  // Required to preserve state when switching tabs
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // not sure what this does but it makes mixin warning disappear
    super.build(context);

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

                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(child: Text('Foodie', style: TextStyle(color: Colors.white, fontSize: 28),)),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/Logo/foodie.jpg'),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DelayInput(personality: 'Foodie',),
                        ));
                  },
                ),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(child: Text('Adventurous', style: TextStyle(color: Colors.white, fontSize: 28),)),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/Logo/adventurous.jpg'),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DelayInput(personality: 'Adventurous',),
                        ));
                  },
                ),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(child: Text('Artistic', style: TextStyle(color: Colors.black, fontSize: 28),)),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/Logo/artistic.jpeg'),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DelayInput(personality: 'Artistic',),
                        ));
                  },
                ),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(child: Text('Nature-Lover', style: TextStyle(color: Colors.orange, fontSize: 28),)),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/Logo/nature.jpg'),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DelayInput(personality: 'Nature-Lover',),
                        ));
                  },
                ),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(child: Text('Shopaholic', style: TextStyle(color: Colors.purple, fontSize: 28),)),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/Logo/shopping.jpg'),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DelayInput(personality: 'Shopaholic',),
                        ));
                  },
                ),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(child: Text('Spontaneous', style: TextStyle(color: Colors.black, fontSize: 27),)),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/Logo/spotaneous.png'),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DelayInput(personality: 'Spontaneous',),
                        ));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
