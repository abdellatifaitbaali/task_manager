import 'package:flutter/material.dart';

class StakedIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new Container(
          height: 60.0,
          width: 60.0,
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(20.0),
              color: Colors.white),
          child: new Icon(
            Icons.calendar_month_rounded,
            color: Color(0xFFFF5252),
            size: 50.0,
          ),
        ),
      ],
    );
  }
}
