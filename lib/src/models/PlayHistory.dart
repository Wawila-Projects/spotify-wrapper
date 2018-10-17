import 'package:spotify_wrapper/src/Abstracts/SpotifyObject.dart';
import 'package:spotify_wrapper/src/models/Context.dart';
import 'package:spotify_wrapper/src/models/Track.dart';
import 'package:spotify_wrapper/src/models/Types.dart';

class PlayHistory extends SpotifyObject{
  ///The track the user listened to.
  Track track;

  ///The date and time the track was played.
  DateTime playedAt;

  ///The context the track was played from.
  Context context;

  PlayHistory(this.track, this.playedAt, this.context) : 
    super (SpotifyType.PlayHistory);
  //TODO Finish this
  factory PlayHistory.fromJSON(Map<String, dynamic> json) {

  }
}