//ReadingPage.dart
//Author: Erick Saenz-Gardea
//Last Updates: Dec 24, 2019
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pracproj/stringcontainer.dart';

///The Reading page is where the user will do all of their reading. 
class ReadingPage extends StatefulWidget {
  final String _text;

  ///Constructor
  ReadingPage(this._text, {Key key}) : super(key: key);

  @override
  _ReadingPage createState() => _ReadingPage(_text);
}

class _ReadingPage extends State<ReadingPage> {
  bool continU = true;
  String _text;
  StringContainer novel;
  int rateOfChange = 300; //300ms delay for 200 words per minute( 60 / 200 *1000)

  ///Constructor for private ReadingPage
  _ReadingPage(this._text) {
    novel = new StringContainer(_text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Reading Page"),
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                  height: 100,
                  child: DrawerHeader(
                    child: Text('Options'),
                    decoration: BoxDecoration(
                      color: Colors.cyan[100],
                    ),
                  )),
              ListTile(
                title: Text('Recents'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Sign out of Google Play'),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        body: Column(
          //TODO: Add more buttons
          children: <Widget>[
            Center(
              child: Text(
                novel.getCurrentWord(),
                style: TextStyle(fontSize: 24),
              ),
            ),
            RaisedButton(
              onPressed: _readOn,
              child: Text("Start Button"),
            ),
            RaisedButton(
              onPressed: _setFlagToFalse,
              child: Text("Stop Button"),
            ),
          ],
        ));
  }

  ///This method will check if we can continue reading, and await the timer before making any changes to the text.
  void _readOn() async {
    continU = true;
    while (continU) {
      await Future.delayed(Duration(milliseconds: rateOfChange), () {
        _changText();
      });
    }
  }

  ///This method will stop the text from changing by setting continU to false.
  void _setFlagToFalse() {
            setState(() {
          continU = false;
        });
    
  }

  ///This method will update the widget's "novel" text being displayed.
  ///
  ///If we have reached the end of the novel, we must stop. 
  void _changText() {
    if (novel.canMoveForward()) {
      if (this.mounted) {
        setState(() {
          novel.moveForward();
        });
      }
    } else {
      _setFlagToFalse();
    }
  }
}
