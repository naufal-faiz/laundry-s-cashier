import 'package:aplikasi_kasir/models/customer.dart';
import 'package:aplikasi_kasir/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(title: Text("Pelanggan")),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final menu = customerList[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menu.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(menu.address),
                ],
              ),
            ),
          );
        },
        itemCount: customerList.length,
      ),
    );
  }
}
