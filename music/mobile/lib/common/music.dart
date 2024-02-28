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

  factory Song.fromJson(Map<String, dynamic> json){
    final int id = json['id'] as int;
    final String title = json['title'] as String;
    final String url = json['link'] as String;
    final String md5 = json['md5_image'] as String;

    if (id != null && title != null && url != null && md5 != null) {
      return Song(id: id, title: title, url: url, md5: md5);
    } else {
      throw FormatException('Failed to get Song');
    }
  }
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
