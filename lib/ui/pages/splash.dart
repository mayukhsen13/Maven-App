import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:otg_learning/config/secure_package.dart';
import 'package:otg_learning/ui/pages/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String userToken;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => goRoute());
  }

  void goRoute() async {
    final token = await SecurePackage.getUserToken();
    print(token);
    setState(() {
      userToken = token;
    });
    if (userToken == null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/main', (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/images/companyLogo.png',
            height: 150.0,
          ),
          SizedBox(
            height: 100.0,
          ),
          SpinKitRipple(
            size: 100,
            color: Colors.redAccent,
          )
        ],
      ),
    );
  }
}
