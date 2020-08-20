import 'package:flutter/material.dart';

import './models/album.dart';

class AlbumView extends StatelessWidget {
  final Album album;

  AlbumView(this.album);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(2),
                      width: mediaQuery.width,
                      height: mediaQuery.width,
                      child: Image.network(
                        album.image,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 2, right: 2),
                      child: FittedBox(
                        child: Text(
                          '${album.title}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        '${album.artist}',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
