import 'dart:async';

import 'package:flutter/material.dart';

import 'home_screen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => HomeScreen())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 1080,
                  height: 150,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Color.fromRGBO(250, 250, 250, 1),
                          radius: 40.0,
                          child: Icon(
                            Icons.edit_calendar_rounded,
                            color: Color(0xFFFF5252),
                            size: 70.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                        ),
                        Text(
                          "My Task Manager",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      //CircularProgressIndicator(backgroundColor: Colors.grey),
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      Text(
                        "By NEXO",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17.0,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 60.0)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
