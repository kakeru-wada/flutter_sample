import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import 'package:provider/provider.dart';
import '../auth.dart';
import '../routing.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: const Card(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                child: SettingsContent(),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class SettingsContent extends StatelessWidget {
  const SettingsContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    children: [
      ...[
        Text(
          'Settings',
          style: Theme.of(context).textTheme.headline4,
        ),
        ElevatedButton(
          onPressed: () {
            context.read<BookstoreAuth>().signOut();
          },
          child: const Text('Sign out'),
        ),
        Link(
          uri: Uri.parse('/book/0'),
          builder: (context, followLink) => TextButton(
            onPressed: followLink,
            child: const Text('Go directly to /book/0 (Link)'),
          ),
        ),
        TextButton(
          child: const Text('Go directly to /book/0 (RouteState)'),
          onPressed: () {
            context.watch<RouteState>().go('/book/0');
          },
        ),
      ].map((w) => Padding(padding: const EdgeInsets.all(8), child: w)),
      TextButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Alert!'),
            content: const Text('The alert description goes here.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
        child: const Text('Show Dialog'),
      )
    ],
  );
}