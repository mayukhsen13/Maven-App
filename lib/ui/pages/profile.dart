import 'package:flutter/material.dart';
import 'package:otg_learning/config/secure_package.dart';
import '../animations/PhotoHero.dart';

import '../widgets/profileTopBar.dart';
import 'package:flutter/cupertino.dart';

class Profile extends StatelessWidget {
  Profile({Key key, this.page}) : super(key: key);

  final String page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).hintColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SafeArea(
                child: Container(
              margin: EdgeInsets.only(top: 75),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          width: 300,
                          child: PhotoHero(
                              photo: "assets/images/user.png",
                              onTap: () => {},
                              width: 200,
                              page: this.page),
                        )),
                    SizedBox(
                      height: 200,
                      width: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Lorem Ipsum',
                                  style: TextStyle(
                                    fontFamily: 'Red Hat Display',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25,
                                    color: Colors.black.withOpacity(1),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'loremipsum@gmail.com',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: Colors.blue),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        'Stream Settings',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ListTile(
                            trailing: Icon(Icons.arrow_forward_ios),
                            title: Text(
                              'Download Settings',
                              style: TextStyle(
                                  fontFamily: "Red Hat Display",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ),
                        )),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListTile(
                          trailing: Icon(Icons.arrow_forward_ios),
                          title: Text(
                            "Playback Options",
                            style: TextStyle(
                                fontFamily: "Red Hat Display",
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        'Account Settings',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ListTile(
                            trailing: Icon(Icons.arrow_forward_ios),
                            title: Text(
                              'Account Security',
                              style: TextStyle(
                                  fontFamily: "Red Hat Display",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ),
                        )),
                    Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ListTile(
                            trailing: Icon(Icons.arrow_forward_ios),
                            title: Text(
                              'Notification Preferences',
                              style: TextStyle(
                                  fontFamily: "Red Hat Display",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ),
                        )),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListTile(
                          trailing: Icon(Icons.arrow_forward_ios),
                          title: Text(
                            "Learning Schedule",
                            style: TextStyle(
                                fontFamily: "Red Hat Display",
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        'Support',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ListTile(
                            trailing: Icon(Icons.arrow_forward_ios),
                            title: Text(
                              'About Orange Tree Global',
                              style: TextStyle(
                                  fontFamily: "Red Hat Display",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ),
                        )),
                    Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ListTile(
                            trailing: Icon(Icons.arrow_forward_ios),
                            title: Text(
                              'Frequently Asked Questions',
                              style: TextStyle(
                                  fontFamily: "Red Hat Display",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ),
                        )),
                    Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ListTile(
                            trailing: Icon(Icons.arrow_forward_ios),
                            title: Text(
                              'Share The App',
                              style: TextStyle(
                                  fontFamily: "Red Hat Display",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ),
                        )),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListTile(
                          trailing: Icon(Icons.arrow_forward_ios),
                          title: Text(
                            "Rate Us",
                            style: TextStyle(
                                fontFamily: "Red Hat Display",
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: MaterialButton(
                          onPressed: () async {
                            await SecurePackage.deleteToken();
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/login', (Route<dynamic> route) => false);
                          },
                          child: Text(
                            'Sign out',
                            style: TextStyle(color: Colors.lightBlue),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Center(
                        child: Text(
                          'Orange Tree Global v1.0.0',
                          style: TextStyle(color: Colors.grey, fontSize: 14.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),

            Positioned(
              top: 0,
              child: ProfileTopBar(),
            ),
            // Positioned(
            //     top: 11,
            //     right: 15,
            //     child: Container(
            //         width: 40,
            //         height: 40,
            //         child: Image.asset('assets/images/user.png',
            //             fit: BoxFit.contain))),
          ],
        ),
      ),
    );
  }
}
