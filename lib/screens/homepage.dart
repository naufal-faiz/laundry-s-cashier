import 'package:flutter/material.dart';
import 'package:aplikasi_kasir/widgets/sidebar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(title: Text("Beranda")),
      body: Center(child: Text("Halaman Beranda")),
    );
  }
}
