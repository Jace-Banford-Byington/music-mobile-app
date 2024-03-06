import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';

// Enum for button state (paused, playing, loading)
enum ButtonState { paused, playing, loading }

class PageManager {
  // ValueNotifier for progress state (current position, buffered position, total duration)
  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );

  // ValueNotifier for button state
  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);

  // AudioPlayer instance
  late AudioPlayer _audioPlayer;

  // URL of the audio file
  final String audioUrl;

  // Constructor
  PageManager(this.audioUrl) {
    _init();
  }

  // Initialize audio player
  void _init() async {
    // Create a new AudioPlayer instance
    _audioPlayer = AudioPlayer();

    // Set the URL of the audio file
    await _audioPlayer.setUrl(audioUrl);

    // Listen for player state changes
    _audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;

      // Update button state based on player state
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        buttonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        buttonNotifier.value = ButtonState.paused;
      } else if (processingState != ProcessingState.completed) {
        buttonNotifier.value = ButtonState.playing;
      } else {
        // If playback completes, seek to the beginning and pause
        _audioPlayer.seek(Duration.zero);
        _audioPlayer.pause();
      }
    });

    // Listen for position updates
    _audioPlayer.positionStream.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });

    // Listen for buffered position updates
    _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });

    // Listen for duration updates
    _audioPlayer.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }

  // Start playback
  void play() {
    _audioPlayer.play();
  }

  // Pause playback
  void pause() {
    _audioPlayer.pause();
  }

  // Seek to a specific position
  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  // Dispose the audio player
  void dispose() {
    _audioPlayer.dispose();
  }
}

// Class for progress bar state
class ProgressBarState {
  final Duration current; // Current position
  final Duration buffered; // Buffered position
  final Duration total; // Total duration

  ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });
}

// Function to search for songs and return a list of Song objects
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

// Class representing a Song
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

  // Factory method to create a Song object from JSON data
  factory Song.fromJson(Map<String, dynamic> json) {
    final int id = json['id'] as int;
    final String title = json['title'] as String;
    final String url = json['preview'] as String;
    final String md5 = json['md5_image'] as String;

    return Song(id: id, title: title, url: url, md5: md5);
  }
}