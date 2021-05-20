import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:otg_learning/config/secure_package.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  void goToMain() async {
    if (formkey.currentState.validate()) {
      var token =
          await authenticateUser(emailController.text, passwordController.text);
      print(token);
      if (token != null) {
        await SecurePackage.setUserToken(token);
        print(SecurePackage.getUserToken().toString() + "hello");

        Navigator.of(context)
            .pushNamedAndRemoveUntil('/main', (Route<dynamic> route) => false);
      } else {
        FocusScope.of(context).unfocus();
        Fluttertoast.showToast(msg: "Failed to authenticate user");
      }
    } else {
      print("not valdated");
    }
  }

  String email;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Material(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      height: 180,
                      child: Image.asset('assets/images/companyLogo.png'),
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    TextFormField(
                        controller: emailController,
                        onChanged: (value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Your Email',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0))),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.lightBlueAccent, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.lightBlueAccent, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                        // ignore: missing_return
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Required';
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return 'Please a valid Email';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          email = value;
                        }),
                    SizedBox(height: 8.0),
                    TextFormField(
                      controller: passwordController,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0))),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.lightBlueAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.lightBlueAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                      // ignore: missing_return
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Required';
                        }
                        if (value.length < 6) {
                          return "Password must be atleast 6 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.0),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Material(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        elevation: 5.0,
                        child: MaterialButton(
                          onPressed: () {
                            goToMain();
                          },
                          minWidth: 200,
                          height: 42,
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

Future<String> authenticateUser(String email, String password) async {
  final http.Response response = await http.post(
      Uri.parse('https://maven.mindwebs.org/api/auth-token/'),
      headers: <String, String>{
        'Accept': 'application/json',
      },
      body: {
        'username': email,
        'password': password,
      });

  if (response.statusCode == 200) {
    print(response.body);
    var parseJson = jsonDecode(response.body);
    return parseJson['token'];
    // return String.fromJson(json.decode(response.body));
  } else {
    return null;
  }
}
