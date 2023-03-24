import 'package:flutter/material.dart';
import 'package:flutter_demo/home.dart';
import 'package:flutter_demo/mine.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _tabIndex = 0;
  static const pages = [HomePage(),MinePage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('title', style: const TextStyle(color: Colors.white)),
        ),
        body: IndexedStack(
          index: _tabIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _tabIndex,
          onTap: (pageIndex) {
            setState(() {
              _tabIndex = pageIndex;
            });
          },
          items: _buildMainBottomItems(),
          selectedItemColor: Colors.blue,
        ),
      ),
    );
  }

  final appBarTitles = ['首页', '我的'];

  List<BottomNavigationBarItem> _buildMainBottomItems() {
    return [
      BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        activeIcon: const Icon(Icons.home),
        label: appBarTitles[0],
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.contact_page),
        activeIcon: const Icon(Icons.contact_page),
        label: appBarTitles[1],
      )
    ];
  }
}

