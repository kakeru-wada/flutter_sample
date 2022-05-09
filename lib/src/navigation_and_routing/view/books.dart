import 'package:flutter/material.dart';
import '../controller/route_state.dart';
import 'package:provider/provider.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: 'Popular', icon: Icon(Icons.people),),
  Tab(text: 'New', icon: Icon(Icons.new_releases),),
  Tab(text: 'All', icon: Icon(Icons.list),)
];

class BooksPage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    var TabProvider = context.watch<TabIndexState>();

    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          TabProvider.tabIndex = tabController.index;
        });
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Books'),
            bottom: const TabBar(
              tabs: tabs
            ),
          ),
        );
      },),
    );
  }
}