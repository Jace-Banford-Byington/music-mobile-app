//////////////////Code in this block taken from Mrfium Article : https://medium.com/@ssk_karna/spotify-play-api-in-flutter-fb5ce9f3bea1

//everything that touches spotify in here 
import 'dart:io';

import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/spotify_oauth2_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

import 'package:http/http.dart' as http;

static Future<void> RemoteService() async {
    AccessTokenResponse? accessToken;
    SpotifyOAuth2Client client = SpotifyOAuth2Client(
      customUriScheme: 'my.music.app',
      //Must correspond to the AndroidManifest's "android:scheme" attribute
      redirectUri: 'my.music.app://callback', //Can be any URI, but the scheme part must correspond to the customeUriScheme
    );
    var authResp = await client.requestAuthorization(
      clientId: CLIENT_ID,
      customParams: {'show_dialog': 'true'},
      scopes: ['user-read-private', 'user-read-playback-state', 'user-modify-playback-state', 'user-read-currently-playing', 'user-read-email']
    );
    var authCode = authResp.code;
    
    accessToken = await client.requestAccessToken(code: authCode.toString(),
        clientId: CLIENT_ID,
        clientSecret: CLIENT_SECRET);

    // Global variables
    Access_Token = accessToken.accessToken;
    Refresh_Token = accessToken.refreshToken;

  }


  Future<void> FetchDevies() async {

     final prefs = await SharedPreferences.getInstance();
     var Access_Token;
     var devicesResponse = await http.get(Uri.parse('https://api.spotify.com/v1/me/player/devices'),
       headers: {
         "content-type": 'application/json',
         "authorization": 'Bearer $Access_Token',
         HttpHeaders.acceptHeader: 'application/json',
       },
     );
     List<AvailableDevice> availableDevices = devicesFromJson(devicesResponse.body).devices! ;
     await prefs.setString('deviceid', availableDevices[0].id.toString());
     Device_ID = prefs.getString('deviceid');
   }


   PlayTrack(String track_id) async {
     var offsetVal = OffsetTrack(position: 0);
     var selectedMusic = Playtrack(
         uris: ["spotify:track:$track_id"],
         offset: offsetVal,
         positionMs: 0
     );

     var playIt = await http.put(Uri.parse('https://api.spotify.com/v1/me/player/play?device_id=$Device_ID'),
         headers: {
           "Content-Type": 'application/json',
           "authorization": 'Bearer $Access_Token',
         },
         body: json.encode(selectedMusic)
     );
   }


   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////