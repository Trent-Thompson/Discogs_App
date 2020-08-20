import 'package:discogs_app/screens/album_view_screen.dart';
import 'package:flutter/material.dart';

import './models/album.dart';

class ListItem extends StatelessWidget {
  final Album album;

  const ListItem(this.album);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      child: LayoutBuilder(builder: (ctx, constraints) {
        return Container(
          height: constraints.maxHeight,
          child: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              Navigator.of(ctx).push(
                  MaterialPageRoute(builder: (_) => AlbumViewScreen(album)));
            },
            child: Card(
              child: Row(
                children: <Widget>[
                  Image.network(album.image),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: constraints.maxHeight * 0.20,
                          left: constraints.maxHeight * 0.20),
                      child: Container(
                        height: constraints.maxHeight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FittedBox(
                              child: Text(
                                album.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: constraints.maxHeight * 0.30,
                                ),
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                album.artist,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: constraints.maxHeight * 0.25,
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
            ),
          ),
        );
      }),
    );
  }
}
