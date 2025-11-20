import 'package:aplikasi_kasir/models/customer.dart';
import 'package:aplikasi_kasir/screens/customer/customer_form.dart';
import 'package:aplikasi_kasir/widgets/customer_card.dart';
import 'package:aplikasi_kasir/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<Customer>('customers');
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(title: Text("Pelanggan")),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, _, __) {
          if (box.isEmpty) {
            return Center(child: Text("kosong"));
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final customer = box.getAt(index);

              return CustomerCard(customer: customer!, index: index);
            },
          );
        },
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
