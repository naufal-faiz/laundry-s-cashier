import 'package:aplikasi_kasir/models/menu.dart';
import 'package:aplikasi_kasir/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(title: Text("Menu")),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Menu menu = menuList[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menu.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("Harga: Rp ${menu.price.toStringAsFixed(0)}"),
                ],
              ),
            ),
          );
        },
        itemCount: menuList.length,
      ),
    );
  }
}
