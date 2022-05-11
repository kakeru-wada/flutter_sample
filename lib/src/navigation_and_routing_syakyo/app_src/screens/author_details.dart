
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data.dart';
import '../routing.dart';
import '../widgets/book_list.dart';

class AuthorDetailsScreen extends StatelessWidget {
  final Author author;

  const AuthorDetailsScreen({
    Key? key,
    required this.author,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(author.name),
    ),
    body: Center(
      child: Column(
        children: [
          Expanded(
            child: BookList(
              books: author.books,
              onTap: (book) {
                context.watch<RouteState>().go('/book/${book.id}');
              },
            ),
          ),
        ],
      ),
    ),
  );
}