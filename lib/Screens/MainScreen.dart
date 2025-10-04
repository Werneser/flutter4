import 'package:flutter/material.dart';
import 'ScreenColumn.dart';
import 'ScreenListView.dart';
import 'ScreenListViewSeparated.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Документы госуслуги - демо',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Секции экрана: Column, ListView, ListView.separated
  final List<Widget> _screens = const [
    ScreenColumn(),
    ScreenListView(),
    ScreenListViewSeparated(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Списки по подаче документов'),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // можно менять на shifting
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_column),
            activeIcon: Icon(Icons.view_column),
            label: 'Column',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            activeIcon: Icon(Icons.list),
            label: 'ListView',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            activeIcon: Icon(Icons.view_list),
            label: 'Separated',
          ),
        ],
      ),
    );
  }
}