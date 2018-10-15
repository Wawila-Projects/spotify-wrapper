import 'dart:async';

import 'package:spotify_wrapper/src/Abstracts/Endpoints.dart';
import 'package:spotify_wrapper/src/models/Track.dart';

class TrackEndpoints extends Endpoints {
  
  ///Get a Track
  Future<Track> getTrack(String id, [String market]) async {
    final reponse = await httpGet('tracks/$id${buildUrl(market: market)}');
    return Track.fromJSON(reponse);
  }
}
