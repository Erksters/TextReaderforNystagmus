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
              },            )
          ],
        ));
  }

  int getGoogleBooks() {
    return 0;
  }

  Future<void> getClipBoardText(BuildContext context) async {
    String clipBoardText = await getData("text/plain");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReadingPage(clipBoardText))
    );
  }

    void getTextFile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReadingPage("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",)),
    );
  }

  Future<String> getData(String format) async {
    final Map<String, dynamic> result = await SystemChannels.platform.invokeMethod(
      'Clipboard.getData',
      format,
    );
    return result['text'];
  }
}
