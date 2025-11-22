import 'package:aplikasi_kasir/models/transaction.dart';
import 'package:aplikasi_kasir/screens/transaction/transaction_form.dart';
import 'package:aplikasi_kasir/widgets/sidebar.dart';
import 'package:aplikasi_kasir/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<Transaction>('transactions');
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(title: Text("Pelanggan")),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, value, child) {
          if (box.isEmpty) {
            return Center(child: Text("kosong"));
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final transaction = box.getAt(index)!;

              return TransactionCard(
                transaction: transaction,
                onComplete: () {
                  transaction.status = "Selesai";
                  box.putAt(index, transaction);
                },
              );
            },
          );
        },
      ),

      // TOMBOL TAMBAH DATA
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TransactionForm()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
