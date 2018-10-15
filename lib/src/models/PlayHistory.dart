import 'package:spotify_wrapper/src/models/Context.dart';
import 'package:spotify_wrapper/src/models/Date.dart';
import 'package:spotify_wrapper/src/models/Track.dart';

class PlayHistory {
  ///The track the user listened to.
  Track track;

  ///The date and time the track was played.
  Date playedAt;

  ///The context the track was played from.
  Context context;
}