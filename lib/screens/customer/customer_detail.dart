import 'package:aplikasi_kasir/models/customer.dart';
import 'package:aplikasi_kasir/screens/customer/customer_edit_form.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CustomerDetail extends StatefulWidget {
  final int index;
  const CustomerDetail({super.key, required this.index});

  @override
  State<CustomerDetail> createState() => _CustomerDetailState();
}

class _CustomerDetailState extends State<CustomerDetail> {
  late Customer customer;
  @override
  void initState() {
    super.initState();
    final box = Hive.box<Customer>('customers');
    customer = box.getAt(widget.index)!;
  }

  // RELOAD DATA APABILA ADA PEMBARUAN
  void reloadCustomer() {
    final box = Hive.box<Customer>('customers');
    setState(() {
      customer = box.getAt(widget.index)!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // DETAIL PELANGGAN
          Text(customer.name),
          Text(customer.phone),
          Text(customer.address),

          // TOMBOL UNTUK EDIT DATA PELANGGAN
          Row(
            children: [
              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CustomerEditForm(index: widget.index),
                    ),
                  );

                  if (result == true) {
                    reloadCustomer();
                  }
                },
                child: Text("Edit"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
