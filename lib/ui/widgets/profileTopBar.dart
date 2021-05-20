import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfileTopBar extends StatefulWidget {
  const ProfileTopBar({
    Key key,
  }) : super(key: key);

  @override
  _ProfileTopBarState createState() => _ProfileTopBarState();
}

class _ProfileTopBarState extends State<ProfileTopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 62,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black12, offset: Offset(0, 5), blurRadius: 5)
      ], color: Theme.of(context).focusColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                  child: Container(
                    child: Icon(Icons.arrow_back_rounded),
                  ),
                  onTap: () => {Navigator.of(context).pop()},
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text("Account",
                      style: Theme.of(context).textTheme.headline2)),
            ],
          ),
        ],
      ),
    );
  }
}
