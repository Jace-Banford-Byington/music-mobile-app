////Placeholder for assignment 

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;


Future<List<Song>> searchSongs() async {
  final response = await http.get(Uri.parse('https://api.deezer.com/search/track/?q=mothermother'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    print('API Response: $responseData');

    final List<dynamic> songsData = responseData['data'];
    final List<Song> songs = songsData.map((songData) {
      print('Song Data: $songData');
      return Song.fromJson(songData);
    }).toList();

    return songs;
  } else {
    throw Exception('Failed to load songs');
  }
}


class Song {
  final int id;
  final String title;
  final String url;
  final String md5;

  const Song({
    required this.id,
    required this.title,
    required this.url,
    required this.md5,
  });


factory Song.fromJson(Map<String, dynamic> json) {
  final int id = json['id'] as int;
  final String title = json['title'] as String;
  final String url = json['link'] as String;
  final String md5 = json['md5_image'] as String;

  return Song(id: id, title: title, url: url, md5: md5);
}


///Go search for music : search / track
///https://api.deezer.com/search/track/${song}
///
///Go search for artist : search / artist
///https://api.deezer.com/search/artist/${artist}
///
///Go search for podcast : search / podcast
///https://api.deezer.com/search/podcast/${podcast}
///
///
///go search for album : search / album
///https://api.deezer.com/search/album/${}
}