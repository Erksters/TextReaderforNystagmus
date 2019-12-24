//HomePage.dart
//Author: Erick Saenz-Gardea
//Last Updates: Dec 24, 2019

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:pracproj/reading_page/reading_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        endDrawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: GoogleSignInButton(text: 'Sign into Google Play Books')),
            RaisedButton(
              child: Text("Read from your Clipboard"),
              textColor: Colors.black,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              onPressed: () {
                getClipBoardText(context);
              },
            ),
            RaisedButton(
              child: Text("Read from a text file"),
              textColor: Colors.black,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              onPressed: () {
                getTextFile(context);
              },
            )
          ],
        ));
  }

  ///This method will be able to send the user to a sign in page, eventually leading to the ReadingPage widget.
  int getGoogleBooks() {
    /*
    *TODO: send the user to a SignInPage
    */
    return 0;
  }

  /// This method will be able to get the users clipboard data and run it in the ReadingPage widget.
  Future<void> getClipBoardText(BuildContext context) async {
    String clipBoardText = await getData("text/plain");
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ReadingPage(clipBoardText)));
  }

  /// This method will be able to look through the users phone directories for a text file.
  ///
  /// Then it will run the data through the ReadingPage Widget.

  void getTextFile(BuildContext context) async {
    File file = await FilePicker.getFile(type: FileType.ANY);
    if (file != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ReadingPage(file.readAsStringSync())),
      );
    }
  }

  ///Helper function for the getClipBoartText() method
  Future<String> getData(String format) async {
    final Map<String, dynamic> result =
        await SystemChannels.platform.invokeMethod(
      'Clipboard.getData',
      format,
    );
    return result['text'];
  }
}
