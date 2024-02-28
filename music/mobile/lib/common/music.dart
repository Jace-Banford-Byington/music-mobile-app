////Placeholder for assignment 
// ignore_for_file: constant_pattern_never_matches_value_type

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<Song> searchSong() async {
  final response = await http.get(Uri.parse('https://api.deezer.com/search/track/?q=mothermother'));

  if(response.statusCode == 200){
        return Song.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }
  else{
     throw Exception('Failed to load album');
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
  // Check if the 'data' field exists in the JSON response
  if (json.containsKey('data')) {
    // Access the 'data' field which contains an array of songs
    final List<dynamic> songsData = json['data'];

    // extract the first song from the array
    if (songsData.isNotEmpty) {
      final Map<String, dynamic> firstSongData = songsData[0];

    
      final int id = firstSongData['id'] as int;
      final String title = firstSongData['title'] as String;
      final String url = firstSongData['link'] as String;
      final String md5 = firstSongData['md5_image'] as String;

      return Song(id: id, title: title, url: url, md5: md5);
    }
  }

  // If 'data' field is not found or is empty, return a default Song object
  return Song(id: 0, title: '', url: '', md5: '');
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