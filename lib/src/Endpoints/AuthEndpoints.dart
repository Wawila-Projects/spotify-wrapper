import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_wrapper/src/StaticClasses/SpotifyWrapper.dart';
import 'package:spotify_wrapper/src/models/AccessToken.dart';

class AuthEndpoints {
  final _basePath = 'https://accounts.spotify.com/api/token';

  Future<AccessToken> getToken() async {
    final headers = {'Authorization': 'Basic ${SpotifyWrapper().authToken}'};
    final body = {'grant_type': 'client_credentials'}; 

    final response =  await http.post('$_basePath', headers: headers, body: body);
    if (response.statusCode == 200) {
      return AccessToken.fromJSON(json.decode(response.body));
    }
    return null;
  }
}