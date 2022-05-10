import 'package:flutter/material.dart';

import '../data.dart';

class AuthorList extends StatelessWidget {
  final List<Author> authors;
  final ValueChanged<Author>? onTap;

  const AuthorList({
    required this.authors,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
    itemCount: authors.length,
    itemBuilder: (context, index) => ListTile(
      title: Text(
        authors[index].name,
      ),
      subtitle: Text(
        '${authors[index].books.length} books',
      ),
      onTap: onTap != null ? () => onTap!(authors[index]) : null,
    ),
  );
}