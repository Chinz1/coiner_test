import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<Map<String, String>> navigationHistory;

  HistoryPage({required this.navigationHistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation History'),
      ),
      body: ListView.builder(
        itemCount: navigationHistory.length,
        itemBuilder: (context, index) {
          final record = navigationHistory[index];
          return ListTile(
            title: Text('Navigation from ${record['from']} to ${record['to']}'),
            subtitle: Text('Date: ${record['date']}'),
          );
        },
      ),
    );
  }
}
