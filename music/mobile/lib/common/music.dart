import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';

Future<List<Song>> searchSongs() async {
  final response = await http.get(Uri.parse('https://api.deezer.com/search/track/?q=mothermother'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = jsonDecode(response.body);

    final List<dynamic> songsData = responseData['data'].take(5).toList();
    final List<Song> songs = songsData.map((songData) {
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
}

AudioPlayer justAudioPlayer = AudioPlayer();
String songLink = "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjUhoO28tqEAxUMHDQIHYVQBjwQtwJ6BAgbEAI&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DdQw4w9WgXcQ&usg=AOvVaw0aHtehaphMhOCAkCydRLZU&opi=89978449";   

void playAudio(String url) async {
  final Uri uri = Uri.parse(url);
  final audioSource = AudioSource.uri(uri);
  await justAudioPlayer.setAudioSource(audioSource);
  await justAudioPlayer.play();
  print("Audio playing");
}