import 'package:spotify_wrapper/src/Abstracts/SpotifyObject.dart';
import 'package:spotify_wrapper/src/models/Cursor.dart';

///The cursor-based paging object is a container for a set of 
///objects. It contains a key called [items] (whose value is an 
///array of the requested objects) along with other keys like 
///[next] and [cursors] that can be useful in future calls.
class CursorBasePaging {
  ///A link to the Web API endpoint returning the full result of the request.
  String href;

  ///The requested Data. 
  ///
  ///It can be any Spotify Object. For example:
  ///`Track`, `Artist`, `Album` or `Playlist` 
  List<SpotifyObject> items;

  ///The maximum number of items in the response (as set in the query or by default).
  int limit;

  ///URL to the next page of items. (`null` if none)
  String next;

  ///The cursors used to find the next set of items.
  Cursor cursor;

  ///The offset of the items returned (as set in the query or by default).
  int offset;

  ///URL to the previous page of items. (`null` if none)
  String previous;

  ///The maximum number of items available to return.
  int total;
}