import 'package:spotify_wrapper/src/models/ExternalUrl.dart';
import 'package:spotify_wrapper/src/models/Types.dart';

class Context { 
  ///The object type, e.g. `artist`, `playlist`, `album`.
  ContextType type;

  ///	A link to the Web API endpoint providing full details of the track.
  String href;

  ///External URLs for this context.
  ExternalUrls externalUrls;

  ///The Spotify URI for the context.
  String uri;
}