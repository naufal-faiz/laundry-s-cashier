import 'package:aplikasi_kasir/models/customer.dart';
import 'package:aplikasi_kasir/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback onComplete;

  const TransactionCard({
    super.key,
    required this.transaction,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    final customerBox = Hive.box<Customer>('customers');
    final customer = customerBox.get(transaction.customerId);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // AMBIL NAMA PELANGGAN
                Text(
                  customer?.name ?? "Unavailable",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // TOTAL HARGA DIBELANJAKAN
                Text(
                  "Harga: Rp ${transaction.totalPrice.toStringAsFixed(0)}",
                  style: TextStyle(fontSize: 10),
                ),

                // TANGGAL MASUK
                Text("Tanggal: ${transaction.dateIn}"),
              ],
            ),

            // STATUS UPDATE JIKA SELESAI
            Row(
              children: [
                IconButton(
                  onPressed: onComplete,
                  icon: Icon(Icons.check_circle),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
