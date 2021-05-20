import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../animations/PhotoHero.dart';
import '../pages/profile.dart';
import '../animations/fadeRoute.dart';

class MyCartTopBar extends StatefulWidget {
  const MyCartTopBar({Key key}) : super(key: key);

  goToProfile(BuildContext context) {
    Navigator.push(
      context,
      FadeRoute(page: Profile(page: "MyCart")),
    );
  }

  @override
  _MyCartTopBarState createState() => _MyCartTopBarState();
}

class _MyCartTopBarState extends State<MyCartTopBar> {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "My Cart",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: PhotoHero(
                    photo: "assets/images/user.png",
                    onTap: () => widget.goToProfile(context),
                    width: 40,
                    page: "MyCart"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
