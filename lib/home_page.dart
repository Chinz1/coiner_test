import 'package:flutter/material.dart';
import 'package:coiner/history_page.dart';
import 'package:coiner/map_page.dart';
import 'package:coiner/profile_page.dart';
import 'package:coiner/support_page.dart';

class MyHomePage extends StatelessWidget {
  final List<Map<String, String>> _navigationHistory = [
    {'from': 'Point A', 'to': 'Point B', 'date': '2024-05-10'},
    {'from': 'Point C', 'to': 'Point D', 'date': '2024-05-11'},
    {'from': 'Point E', 'to': 'Point F', 'date': '2024-05-12'},
    {'from': 'Point G', 'to': 'Point H', 'date': '2024-05-13'},
    {'from': 'Point I', 'to': 'Point J', 'date': '2024-05-14'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coiner.cab Corp Test App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                // Navigate to Profile page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Support'),
              onTap: () {
                // Navigate to Support page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SupportPage()),
                );
              },
            ),
            ListTile(
              title: const Text('History'),
              onTap: () {
                // Navigate to History page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HistoryPage(navigationHistory: _navigationHistory)),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navigate to Map page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapPage()),
                );
              },
              child: const Text('Map'),
            ),
          ],
        ),
      ),
    );
  }
}
