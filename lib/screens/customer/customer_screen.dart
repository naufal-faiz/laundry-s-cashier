import 'package:aplikasi_kasir/models/customer.dart';
import 'package:aplikasi_kasir/screens/customer/customer_form.dart';
import 'package:aplikasi_kasir/widgets/customer_card.dart';
import 'package:aplikasi_kasir/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CustomerForm()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
