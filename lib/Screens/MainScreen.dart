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

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Списки по подаче документов'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Column'),
            Tab(text: 'ListView'),
            Tab(text: 'ListView.separated'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ScreenColumn(),
          ScreenListView(),
          ScreenListViewSeparated(),
        ],
      ),
    );
  }
}