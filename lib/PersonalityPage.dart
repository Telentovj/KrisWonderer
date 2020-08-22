import 'package:flutter/material.dart';

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

    return Container(
      child: Center(
          child: Text("Where the user takes personality test thing")
      ),
    );
  }
}
