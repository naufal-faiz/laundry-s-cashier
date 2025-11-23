import 'package:aplikasi_kasir/models/menu.dart';
import 'package:aplikasi_kasir/models/customer.dart';
import 'package:aplikasi_kasir/models/transaction.dart';
import 'package:aplikasi_kasir/models/transaction_item.dart';
import 'package:aplikasi_kasir/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PurchaseRow {
  Menu? menu;
  TextEditingController qty = TextEditingController();
}

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  Customer? selectedCustomer;

  // LIST DINAMIS UNTUK INPUT PEMBELIAN
  List<PurchaseRow> purchaseRows = [PurchaseRow()];

  @override
  Widget build(BuildContext context) {
    final customerBox = Hive.box<Customer>('customers');
    final menuBox = Hive.box<Menu>('items');
    final transactionBox = Hive.box<Transaction>('transactions');

    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(title: Text("Transaksi Baru")),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Nama Pelanggan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            // DROPDOWN UNTUK PILIH PELANGGAN
            DropdownButtonFormField<Customer>(
              decoration: const InputDecoration(labelText: "Pilih Pelanggan"),
              initialValue: selectedCustomer,
              items: customerBox.values
                  .map(
                    (customer) => DropdownMenuItem(
                      value: customer,
                      child: Text(customer.name),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCustomer = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // PEMBELIAN BARANG
            Expanded(
              child: ListView.builder(
                itemCount: purchaseRows.length,
                itemBuilder: (context, index) {
                  final row = purchaseRows[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            // PILIH JENIS MENU
                            child: DropdownButtonFormField<Menu>(
                              decoration: const InputDecoration(
                                labelText: "Pilih Laundry",
                              ),
                              items: menuBox.values
                                  .map(
                                    (menu) => DropdownMenuItem(
                                      value: menu,
                                      child: Text(menu.name),
                                    ),
                                  )
                                  .toList(),
                              initialValue: row.menu,
                              onChanged: (value) {
                                setState(() {
                                  row.menu = value;
                                });
                              },
                            ),
                          ),

                          const SizedBox(width: 10),

                          // QUANTITY ATAU JUMLAH DARI SUATU PILIHAN
                          SizedBox(
                            width: 80,
                            child: TextFormField(
                              controller: row.qty,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: "Qty",
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),
                          Text(row.menu?.type ?? ""),

                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (purchaseRows.length > 1) {
                                  purchaseRows.removeAt(index);
                                }
                              });
                            },
                            icon: const Icon(
                              Icons.exposure_minus_2_rounded,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // TOMBOL TAMBAH JENIS PESANAN
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text("Tambah Input"),
              onPressed: () {
                setState(() {
                  purchaseRows.add(PurchaseRow());
                });
              },
            ),

            // TOMBOL SIMPAN
            ElevatedButton(
              onPressed: () async {
                if (selectedCustomer == null) return;

                List<TransactionItem> items = [];
                double totalPrice = 0;

                for (var row in purchaseRows) {
                  if (row.menu == null || row.qty.text.isEmpty) continue;

                  final qty = double.tryParse(row.qty.text) ?? 1;
                  final subtotal = row.menu!.price * qty;

                  items.add(
                    TransactionItem(
                      menu: row.menu!,
                      qty: qty,
                      totalPrice: subtotal,
                    ),
                  );

                  totalPrice += subtotal;
                }

                if (items.isEmpty) return;

                final transaction = Transaction(
                  customerId: selectedCustomer!.id!,
                  items: items,
                  status: "pending",
                  dateIn: DateTime.now(),
                  totalPrice: totalPrice,
                );

                final box = transactionBox;
                final key = await box.add(transaction);

                transaction.id = key;

                await box.put(key, transaction);
                Navigator.pop(context, true);
              },
              child: Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
