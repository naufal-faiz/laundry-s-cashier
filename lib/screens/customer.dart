import 'package:aplikasi_kasir/models/customer.dart';
import 'package:aplikasi_kasir/widgets/customer_card.dart';
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
          return CustomerCard(customer: customerList[index]);
        },
        itemCount: customerList.length,
      ),
    );
  }
}
