import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/library.dart';
import '../routing.dart';
import '../widgets/author_list.dart';

class AuthorsScreen extends StatelessWidget {
  final String title = 'Authors';

  const AuthorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: AuthorList(
      authors: libraryInstance.allAuthors,
      onTap: (author) {
        context.read<RouteState>().go('/author/${author.id}');
      },
    ),
  );
}