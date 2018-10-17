import 'dart:async';

import 'package:spotify_wrapper/src/Abstracts/Endpoints.dart';
import 'package:spotify_wrapper/src/models/Device.dart';
import 'package:spotify_wrapper/src/models/PlayingContext.dart';

///__Beta__.
///These endpoints are in Beta. While we encourage you to build with them, 
///a situation may arise where we need to disable some or all of the 
///functionality and/or change how they work without prior notice. Please 
///report any issues via our 
///[GitHub issue tracker](https://github.com/spotify/web-api/issues).
///
///You can read more about how to work with the Spotify Connect Web API 
///[here](https://developer.spotify.com/documentation/web-api/guides/using-connect-web-api/).
class PlayerEndpoints extends Endpoints {
  final urlSegement = 'me/player';

  ///Get a User's Available Devices
  Future<List<Device>> getAvailableDevices() async {
    final response = await httpGet('$urlSegement/devices');
    final values = List<Map<String, dynamic>>.from(response['devices']);
    var devices = List<Device>();
    for (var device in values) {
      devices.add(Device.fromJSON(device));
    }
    return devices;
  }

  ///Get Information About The User's Current Playback
  Future<PlayingContext> getPlayingContext() async {
    final response = await httpGet('$urlSegement');
    return PlayingContext.fromJSON(response);
  }

  Future<void> play({String deviceID, String contextUri, 
    List<String> uris, Map<String, dynamic> object, int positionMS}) async {
    var body = {
      'context_uri': contextUri,
      'uris': uris,
      'object': object,
      'position_ms': positionMS
    };
    
    body.removeWhere((k,v) => v == null);

    var query = '';
    if (deviceID != null) {
      query = '?device_id=$deviceID';
    }
    await httpPut('$urlSegement/play$query');
  }

  Future<void> pause({String deviceID}) async {
    var query = '';
    if (deviceID != null) {
      query = '?device_id=$deviceID';
    }
    await httpPut('$urlSegement/pause$query');
  }

  Future<void> seek(int positionMS, {String deviceID}) async {
    var query = '';
    if (deviceID != null) {
      query = '&device_id=$deviceID';
    }
    await httpPut('$urlSegement/next?position_ms=$positionMS$query');
  }

  Future<void> next({String deviceID}) async {
    var query = '';
    if (deviceID != null) {
      query = '?device_id=$deviceID';
    }
    await httpPost('$urlSegement/next$query');
  }

  Future<void> previous({String deviceID}) async {
    var query = '';
    if (deviceID != null) {
      query = '?device_id=$deviceID';
    }
    await httpPost('$urlSegement/previous$query');
  }
}