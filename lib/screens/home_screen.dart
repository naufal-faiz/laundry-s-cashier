import 'package:flutter/material.dart';
import 'package:aplikasi_kasir/widgets/sidebar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(title: Text("Beranda")),
      body: Center(child: Text("Halaman Beranda")),
    );
  }
}
