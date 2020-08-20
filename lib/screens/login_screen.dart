import 'package:flutter/material.dart';

import '../logincard.dart';

class LoginScreen extends StatelessWidget {
  static const image =
      'https://upload.wikimedia.org/wikipedia/en/thumb/e/e8/Discogs_logo.svg/1200px-Discogs_logo.svg.png';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Discogs Collection'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: mediaQuery.height * 0.15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: mediaQuery.height * 0.15,
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.02,
              ),
              LoginCard(),
            ],
          ),
        ),
      ),
    );
  }
}
