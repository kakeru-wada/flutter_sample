
class ParsedRoute {
  final Uri uri;

  ParsedRoute.add() : uri = Uri(path: '/add');
  ParsedRoute.home() : uri = Uri(path: '/home');

  bool get isAddSection => (uri == ParsedRoute.add().uri);
  bool get isHomeSection => (uri == ParsedRoute.home().uri);
}