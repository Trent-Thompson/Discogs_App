import 'package:discogs_app/models/album_json.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import './list_item.dart';
import './models/album.dart';
import './models/album_json.dart';

Future<AlbumJson> fetchAlbumList(url) async {
  var response = await http.get(url);

  // Check if the response was good
  if (response.statusCode == 200) {
    // Parse the json from the repsponse
    AlbumJson albumList = AlbumJson.fromJson(json.decode(response.body));

    // Make a new url from the 'next' json item
    String nextUrl = albumList.pagination.urls.next;

    // Loop until there is no 'next' available
    while (nextUrl != null) {
      // Make another http request
      response = await http.get(nextUrl);

      // Check response for good again
      if (response.statusCode == 200) {
        // if it was good, parse the json
        AlbumJson nextAlbum = AlbumJson.fromJson(json.decode(response.body));

        // Add the json we just got to the overall list
        albumList.releases.addAll(nextAlbum.releases);

        //
        nextUrl = nextAlbum.pagination.urls.next;
      } else {
        throw Exception('Failed to load');
      }
    }

    return albumList;
  } else {
    throw Exception('Failed to load');
  }
}

class AlbumList extends StatefulWidget {
  String url;
  final username;

  AlbumList(this.username) {
    this.url =
        "https://api.discogs.com/users/${username.toString()}/collection/folders/0/releases?sort=added&sort_order=desc&key=fOSJmCUaxdXHWSWrhvlS&secret=cLOrzgGMySRDVTXCipEdVLSkwIKmndyT";
  }

  @override
  _AlbumListState createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  List<Album> albumList;
  Future<AlbumJson> futureAlbum;
  final List<String> menuOptions = ['By Artist', 'By Album'];
  String dropdownValue;
  String searchFilter = '';

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbumList(widget.url);
    dropdownValue = menuOptions[0];
  }

  void _alphabetizeTitle() {
    setState(() {
      albumList.sort((a, b) => a.title.compareTo(b.title));
    });
  }

  void _alphabetizeArtist() {
    setState(() {
      albumList.sort((a, b) => a.artist.compareTo(b.artist));
    });
  }

  Widget _buildAlbumList(mediaQuery) {
    List<Album> filteredList = albumList.where((album) {
      return album.artist.toUpperCase().contains(searchFilter.toUpperCase()) ||
          album.title.toUpperCase().contains(searchFilter.toUpperCase());
    }).toList();

    return Expanded(
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return ListItem(filteredList[index]);
        },
        itemCount: filteredList.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.username + '\'s Collection'),
          backgroundColor: Colors.black,
          actions: <Widget>[
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(
                      Icons.list,
                      color: Colors.white,
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        dropdownValue = newValue;

                        if (dropdownValue == menuOptions[0]) {
                          _alphabetizeArtist();
                        } else {
                          _alphabetizeTitle();
                        }
                      });
                    },
                    items: menuOptions.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                            color: item == dropdownValue
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            albumList == null
                ? FutureBuilder<AlbumJson>(
                    future: futureAlbum,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        albumList = snapshot.data.releases.map((album) {
                          return Album(
                            album.basicInformation.title,
                            album.basicInformation.artists[0].name,
                            album.basicInformation.coverImage,
                          );
                        }).toList();

                        if (albumList.length == 0) {
                          print('Found user, no albums');
                          return Center(
                            child: Text("No albums found!"),
                          );
                        }

                        albumList.sort((a, b) => a.artist.compareTo(b.artist));

                        return _buildAlbumList(mediaQuery);
                      } else if (snapshot.hasError) {
                        print(snapshot.error);
                        return Center(
                          child: Text(
                            "No albums found!",
                            style:
                                TextStyle(fontSize: mediaQuery.height * 0.025),
                          ),
                        );
                      }

                      return Center(
                        child: SizedBox(
                          height: mediaQuery.height * 0.15,
                          width: mediaQuery.height * 0.15,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.grey),
                          ),
                        ),
                      );
                    },
                  )
                : _buildAlbumList(mediaQuery),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                ),
                onChanged: (value) {
                  setState(() {
                    searchFilter = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
