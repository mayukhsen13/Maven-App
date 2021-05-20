import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../animations/PhotoHero.dart';
import '../pages/profile.dart';
import '../animations/fadeRoute.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key key, this.page}) : super(key: key);

  final String page;

  goToProfile(BuildContext context) {
    Navigator.push(
      context,
      FadeRoute(page: Profile(page: this.page)),
    );
  }

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
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
                  "Hi, Aayush.",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: PhotoHero(
                    photo: "assets/images/user.png",
                    onTap: () => widget.goToProfile(context),
                    width: 40,
                    page: widget.page),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
