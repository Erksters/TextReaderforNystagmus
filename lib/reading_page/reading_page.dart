import 'package:flutter/material.dart';

class ReadingPage extends StatelessWidget {
  final String text;

  ReadingPage({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reading Page"),
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
      body: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
