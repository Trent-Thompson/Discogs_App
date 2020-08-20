import 'package:discogs_app/album_view.dart';
import 'package:flutter/material.dart';

import '../models/album.dart';

class AlbumViewScreen extends StatelessWidget {
  final Album album;

  AlbumViewScreen(this.album);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          album.title,
        ),
        backgroundColor: Colors.black,
      ),
      body: AlbumView(album),
    );
  }
}
