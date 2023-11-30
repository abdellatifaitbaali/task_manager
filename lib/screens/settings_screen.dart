import 'package:flutter/material.dart';
import 'package:task_manager/helpers/database_helper.dart';
import 'home_screen.dart';
import 'stacked_icons.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

showAlertDialog(BuildContext context) async {
  // set up the buttons
  // ignore: deprecated_member_use
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  // ignore: deprecated_member_use
  Widget continueButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      DatabaseHelper.instance.deleteAllTask();
      Toast.show("All data cleared", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Text("Would you like to clear all data? It cannot be undone."),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomeScreen()))),
        title: Row(children: [
          Text(
            'S',
            style: const TextStyle(
              color: Colors.redAccent,
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
              'ettings',
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ))
        ]),
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 60.0, 25.0, 25.0),
        child: Container(
          width: double.infinity,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 1080,
                height: 150,
                child: const DecoratedBox(
                  decoration: const BoxDecoration(),
                ),
              ),
              new StakedIcons(),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: new Text(
                      "My Task Manager",
                      style: new TextStyle(fontSize: 20.0, color: Colors.grey),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, left: 25.0, right: 20.0, bottom: 40.0),
              ),
              SizedBox(
                width: 1080,
                height: 1,
                child: const DecoratedBox(
                  decoration: const BoxDecoration(),
                ),
              ),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 40.0, right: 40.0, bottom: 30.0),
                        child: GestureDetector(
                          onTap: () {
                            showAlertDialog(context);
                          },
                          child: new Container(
                              alignment: Alignment.center,
                              height: 40.0,
                              decoration: new BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: new BorderRadius.circular(9.0)),
                              child: new Text("Clear All Data",
                                  style: new TextStyle(
                                      fontSize: 17.0, color: Colors.white))),
                        ),
                      ),
                    ),
                    ]),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0.0, left: 40.0, right: 40.0, bottom: 30.0),
                          child: new Container(
                            alignment: Alignment.center,
                            height: 40.0,
                            decoration: new BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: new BorderRadius.circular(9.0)),
                            child: InkWell(
                              child: new Text(
                                "About Us",
                                style: new TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.white,
                                    backgroundColor: Colors.transparent),
                                textAlign: TextAlign.center,
                              ),
                              onTap: () =>
                                  launch('https://www.github.com/N-E-X-O'),
                            ),
                          ),
                        )
                    )
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
