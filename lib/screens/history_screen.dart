import 'package:aplikasi_kasir/models/history.dart';
import 'package:aplikasi_kasir/widgets/history_card.dart';
import 'package:aplikasi_kasir/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(title: Text("History")),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return HistoryCard(history: historyList[index]);
        },
        itemCount: historyList.length,
      ),
    );
  }
}
