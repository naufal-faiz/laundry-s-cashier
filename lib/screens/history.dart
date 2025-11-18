import 'package:aplikasi_kasir/models/history.dart';
import 'package:aplikasi_kasir/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(title: Text("History")),
      body: ListView.builder(
        itemCount: historyList.length,
        itemBuilder: (context, index) {},
      ),
    );
  }
}
