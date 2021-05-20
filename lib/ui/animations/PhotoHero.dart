import 'package:flutter/material.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero(
      {Key key,
      @required this.photo,
      @required this.onTap,
      @required this.width,
      @required this.page})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;
  final String page;

  Widget build(BuildContext context) {
    return SizedBox(
      width: this.width,
      height: this.width,
      child: Hero(
        tag: this.page,
        child: GestureDetector(
          onTap: this.onTap,
          child: Image.asset(
            photo,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
