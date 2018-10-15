import 'dart:async';
import 'dart:convert' show base64, utf8;

import 'package:spotify_wrapper/src/Endpoints/ArtistsEndpoints.dart';
import 'package:spotify_wrapper/src/Endpoints/AuthEndpoints.dart';
import 'package:spotify_wrapper/src/Endpoints/SearchEndpoints.dart';
import 'package:spotify_wrapper/src/models/AccessToken.dart';

class SpotifyWrapper {
  static final SpotifyWrapper _instance = SpotifyWrapper._internal();
  SpotifyWrapper._internal();

  factory SpotifyWrapper() {
    return _instance;
  }

  String _id;
  String _secret;
  String get authToken =>  base64.encode(utf8.encode('$_id:$_secret'));
  
  AccessToken _accessToken; 
  String get accessToken => _accessToken?.token;

  ArtistsEndpoints artistEndpoint = ArtistsEndpoints();
  SearchEndpoints searchEndpoints = SearchEndpoints();

  Future<void> initializeWrapper(String id, String secret) async {
    _id = id;
    _secret = secret;
    await setAccessToken();
  }

  Future<void> setAccessToken() async {
    final authEndpoint = AuthEndpoints();
    final token = await authEndpoint.getToken();
    _accessToken = token;
  }
}