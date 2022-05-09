import 'package:collection/collection.dart';
import 'package:quiver/core.dart';

import 'parser.dart';

class ParsedRoute {
  final String path;// (/book/123)

  final String pathTemplate;// (/book/:id)

  final Map<String, String> parameters;// ({id: 123})

  final Map<String, String> queryParameters;// ({search: abc})

  static const _mapEquality = MapEquality<String, String>();

  ParsedRoute(
      this.parameters, this.path, this.pathTemplate, this.queryParameters
      );

  @override
  bool operator ==(Object other) =>
      other is ParsedRoute &&
          other.pathTemplate == pathTemplate &&
          other.path == path &&
          _mapEquality.equals(parameters, other.parameters) &&
          _mapEquality.equals(queryParameters, other.queryParameters);

  @override
  int get hashCode => hash4(
    path,
    pathTemplate,
    _mapEquality.hash(parameters),
    _mapEquality.hash(queryParameters),
  );

  @override
  String toString() => '<ParsedRoute '
      'template: $pathTemplate '
      'path: $path '
      'parameters: $parameters '
      'query parameters: $queryParameters>';
}