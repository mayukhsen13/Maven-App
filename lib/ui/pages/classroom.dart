import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Classroom extends StatelessWidget {
  const Classroom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Theme.of(context).hintColor,
      child: Center(
        child: Text("Classroom"),
      ),
    );
  }
}
