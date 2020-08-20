import 'package:flutter/material.dart';

import './album_list.dart';

class LoginCard extends StatelessWidget {
  final _usernameController = TextEditingController();

  void _verifyUsername(String username, BuildContext ctx) {
    if (username.length != 0) {
      Navigator.of(ctx)
          .push(MaterialPageRoute(builder: (_) => AlbumList(username)));

      _usernameController.text = "";
    } else {
      Scaffold.of(ctx).showSnackBar(SnackBar(
        content: Text('You must enter a username'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(
        left: mediaQuery.width * 0.10,
        right: mediaQuery.width * 0.10,
      ),
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(mediaQuery.width * 0.05),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
                controller: _usernameController,
                onSubmitted: (_) =>
                    _verifyUsername(_usernameController.text, context),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: mediaQuery.width * 0.05),
              child: RaisedButton(
                color: Colors.black,
                child: Text(
                  'Go',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () =>
                    _verifyUsername(_usernameController.text, context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
